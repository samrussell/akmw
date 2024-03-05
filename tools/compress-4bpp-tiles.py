from argparse import ArgumentParser
from struct import unpack
from io import BytesIO
from os import SEEK_CUR

RLE_FLAG = 0x80
COUNT_MASK = 0x7f

def compress_tiles(file):
    file_content = file.read()
    output = []
    for i in range(4):
        input = BytesIO(file_content[i::4])
        while True:
            chunk = input.read(1)
            if not chunk:
                break
            first_char = chunk[0]
            count = 1
            while True:
                chunk = input.read(1)
                if not chunk:
                    break
                next_char = chunk[0]
                if next_char != first_char:
                    input.seek(-1, SEEK_CUR)
                    break
                count += 1
                if count == 0x7f:
                    break
            if count > 1:
                # rle print
                count_and_flag = count
                data = [first_char]
            else:
                data = []
                count = 0
                # edge case: if we go 0x7F chars with only doubles then make a note to stop there
                future_data = input.read(0x7e)
                input.seek(-len(future_data), SEEK_CUR)
                would_max_data = False
                max_data_offset = 0
                if len(future_data) == 0x7e:
                    for i in range(len(future_data)-1):
                        would_max_data = True
                        if future_data[i] == future_data[i+1]:
                            # we are really guessing here
                            # they don't pick the end, they pick one in the middle
                            # im guessing a 0x40 byte window
                            if i < 0x40:
                                max_data_offset = i
                            # case 3: out of data
                            if i + 2 == len(future_data):
                                would_max_data = False
                                break
                            # case 1: we have 3 in a row
                            if future_data[i+2] == future_data[i]:
                                would_max_data = False
                                break
                            # case 2: we have 2x2
                            if future_data[i+2] == future_data[i+3]:
                                would_max_data = False
                                break
                while True:
                    chunk = input.read(1)
                    if not chunk:
                        data.append(first_char)
                        count += 1
                        break
                    next_char = chunk[0]
                    if next_char == first_char:
                        # if there's nothing interesting in 0x7f bytes then just return this
                        if would_max_data and count-1 == max_data_offset:
                            input.seek(-2, SEEK_CUR)
                            break
                        chunk = input.read(2)
                        # case 1: we have 3 in a row
                        if chunk and chunk[0] == next_char:
                            input.seek(-2 - len(chunk), SEEK_CUR)
                            break
                        # case 2: we have 2x2 in a row
                        if chunk and len(chunk) == 2 and chunk[0] == chunk[1]:
                            input.seek(-2 - len(chunk), SEEK_CUR)
                            break
                        # case 3: there are no more bytes to read
                        if not chunk:
                            input.seek(-2, SEEK_CUR)
                            break
                        input.seek(-len(chunk), SEEK_CUR)
                    else:
                        # edge case 4: last char is 0
                        # i can't think of a sensible reason for this
                        # they end the stream 1 byte early
                        # then place a 81 00
                        # for the final 0
                        # if we enable this other files break and i have no idea why
                        # so we'll put in as a hack
                        if next_char == 0:
                            chunk = input.read(1)
                            if not chunk:
                                if file.name == 'build/sprites/uncompressed/alexKiddEatingRiceBall.bin':
                                    data.append(first_char)
                                    count += 1
                                    input.seek(-1, SEEK_CUR)
                                    break
                            else:
                                input.seek(-1, SEEK_CUR)
                    data.append(first_char)
                    first_char = next_char
                    count += 1
                    if count == 0x7f:
                        input.seek(-1, SEEK_CUR)
                        break
                count_and_flag = RLE_FLAG | count
            output.append(count_and_flag)
            output += data
        output.append(0)
    return output
    
if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('infile')
    parser.add_argument('outfile')
    args = parser.parse_args()

    with open(args.infile, 'rb') as h_infile:
        output = compress_tiles(h_infile)
    with open(args.outfile, 'wb') as h_outfile:
        h_outfile.write(bytes(output))
