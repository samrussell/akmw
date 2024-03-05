from argparse import ArgumentParser
from struct import unpack

BLANK_LINE = 0x00
END_SEQUENCE = 0xFF
END_LINE = 0xFE

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
        code, = unpack('<B', file.read(1))
        if code == 0xFF:
            decoded_lines.append('ET_END_SEQUENCE')
            break
        elif code == 0xFE:
            decoded_lines.append('ET_END_LINE')
        elif code == 0x00:
            decoded_lines.append('ET_BLANK_LINES')
        else:
            indent, = unpack("<B", file.read(1))
            count = code
            data = file.read(count)
            decoded_data = []
            for char in data:
                if char not in CHAR_MAP:
                    raise Exception('Could not decode byte %02X' % char)
                decoded_data.append(CHAR_MAP[char])
            decoded_str = ''.join(decoded_data)
            decoded_line = 'ET_PRINT $%x "%s"' % (indent, decoded_str)
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
        h_outfile.write(text + '\n')
