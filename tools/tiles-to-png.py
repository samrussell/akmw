from argparse import ArgumentParser
from PIL import Image, ImagePalette
import binascii

def palette_to_rgb(val):
    blue = 0x55 * (0x03 & (val >> 4))
    green = 0x55 * (0x03 & (val >> 2))
    red = 0x55 * (0x03 & val)
    return [red, green, blue]

def convert_tiles_to_png(file):
    # load 8 lines
    lines = [[] for _ in range(8)]
    height = 8
    width = 0
    while True:
        data = file.read(4*8)
        if not data:
            break
        for y in range(8):
            # each byte has 8 pixels worth of bits
            line = [0] * 8
            for bit_index in range(4):
                bits = data[bit_index + 4*y]
                for x in range(8):
                    bit = 0x01 & (bits >> x)
                    bit = bit << bit_index
                    # lsb is on the left
                    line[7-x] += bit
            lines[y] += line
        width += 8
    # save as PNG
    # this is the level 1 palette
    raw_palette = binascii.a2b_hex('303f373b0f0b002f060b013e380c083c303f050b030200303c0c0f083a36030a')
    rgb_palette = []
    for val in raw_palette:
        rgb_palette += palette_to_rgb(val)
    palette = ImagePalette.ImagePalette(mode='RGB', palette=rgb_palette)
    outdata = []
    for line in lines:
        outdata += line
    #image = Image.frombuffer('P', (width, height), outdata, 'raw', 'P', 0, 1)
    image = Image.new('P', (width, height))
    image.putdata(outdata)
    image.putpalette(palette)
    return image

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('infile')
    parser.add_argument('outfile')
    args = parser.parse_args()

    with open(args.infile, 'rb') as h_infile:
        image = convert_tiles_to_png(h_infile)
    with open(args.outfile, 'wb') as h_outfile:
        #h_outfile.write(output)
        image.save(h_outfile)
