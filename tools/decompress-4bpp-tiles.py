from argparse import ArgumentParser
from struct import unpack

RLE_FLAG = 0x80
COUNT_MASK = 0x7f

def decompress_tiles(file):
    outputs = [[], [], [], []]
    endings = 0
    while endings < 4:
        count_and_rle, = unpack("<B", file.read(1))
        if count_and_rle == 0:
            endings += 1
            continue
        # high bit 0 = rle
        not_rle = count_and_rle & RLE_FLAG
        count = count_and_rle & COUNT_MASK
        if not_rle:
            outputs[endings] += list(file.read(count))
        else:
            outputs[endings] += list(file.read(1) * count)
    return outputs
    
if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('infile')
    parser.add_argument('outfile')
    args = parser.parse_args()

    with open(args.infile, 'rb') as h_infile:
        outputs = decompress_tiles(h_infile)
        for i in range(len(outputs)):
            outputs[i].reverse()
    with open(args.outfile, 'wb') as h_outfile:
        total_output = []
        while outputs[-1]:
            for i in range(len(outputs)):
                total_output.append(outputs[i].pop())
        h_outfile.write(bytes(total_output))
