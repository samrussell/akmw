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
                while True:
                    chunk = input.read(1)
                    if not chunk:
                        data.append(first_char)
                        count += 1
                        break
                    next_char = chunk[0]
                    if next_char == first_char:
                        chunk = input.read(2)
                        # case 1: we have 3 in a row
                        if chunk and chunk[0] == next_char:
                            input.seek(-2 - len(chunk), SEEK_CUR)
                            break
                        # case 2: we have 2x2 in a row
                        if chunk and chunk[0] == chunk[1]:
                            input.seek(-2 - len(chunk), SEEK_CUR)
                            break
                        input.seek(-len(chunk), SEEK_CUR)
                    data.append(first_char)
                    first_char = next_char
                    count += 1
                    if count == 0x7f:
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
