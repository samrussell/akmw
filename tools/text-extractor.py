from argparse import ArgumentParser
from struct import unpack

RLE_FLAG = 0x80
COUNT_MASK = 0x7F
DIRECTION_RIGHT = 0x20
DIRECTION_DOWN = 0x80
DIRECTION_LEFT = 0x60
DIRECTION_UP = 0xC0
DIRECTION_MAP = {
    DIRECTION_RIGHT: 'RIGHT',
    DIRECTION_DOWN: 'DOWN',
    DIRECTION_LEFT: 'LEFT',
    DIRECTION_UP: 'UP',
}

CHAR_MAP = {
    0xB0: ' ',
    0xB1: '!',
    0xB2: '\\"',
    0xB7: "'",
    0xBC: ',',
    0xBD: '-',
    0xBE: '.',
    0xCF: '?',
    0xD1: 'A',
    0xD2: 'B',
    0xD3: 'C',
    0xD4: 'D',
    0xD5: 'E',
    0xD6: 'F',
    0xD7: 'G',
    0xD8: 'H',
    0xD9: 'I',
    0xDA: 'J',
    0xDB: 'K',
    0xDC: 'L',
    0xDD: 'M',
    0xDE: 'N',
    0xDF: 'O',
    0xE0: 'P',
    0xE1: 'Q',
    0xE2: 'R',
    0xE3: 'S',
    0xE4: 'T',
    0xE5: 'U',
    0xE6: 'V',
    0xE7: 'W',
    0xE8: 'X',
    0xE9: 'Y',
    0xEA: 'Z',
}

def extract_text(file):
    decoded_lines = []
    while True:
        count_and_rle, direction = unpack("<BB", file.read(2))
        if count_and_rle == 0:
            break
        rle = count_and_rle & RLE_FLAG
        count = count_and_rle & COUNT_MASK
        read_count = count if not rle else 1
        data = file.read(read_count)
        decoded_data = []
        for char in data:
            if char not in CHAR_MAP:
                raise Exception("Could not decode byte %02X" % char)
            decoded_data.append(CHAR_MAP[char])
        decoded_str = ''.join(decoded_data)
        if rle:
            decoded_line = 'AKPRINTRLE%s $%x "%s"' % (
                DIRECTION_MAP[direction],
                count,
                decoded_str
            )
        else:
            decoded_line = 'AKPRINT%s "%s"' % (
                DIRECTION_MAP[direction],
                decoded_str
            )
        decoded_lines.append(decoded_line)
    return '\n'.join(decoded_lines)

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('infile')
    parser.add_argument('outfile')
    args = parser.parse_args()

    with open(args.infile, 'rb') as h_infile:
        text = extract_text(h_infile)
    with open(args.outfile, 'w') as h_outfile:
        h_outfile.write(text + '\nAKPRINTEND\n')
