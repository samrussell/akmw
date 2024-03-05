from argparse import ArgumentParser
from PIL import Image, ImagePalette
import binascii

def palette_to_rgb(val):
    blue = 0x55 * (0x03 & (val >> 4))
    green = 0x55 * (0x03 & (val >> 2))
    red = 0x55 * (0x03 & val)
    return [red, green, blue]

def convert_png_to_tiles(file):
    image = Image.open(file)
    image.load()
    # this is the level 1 palette
    raw_palette = binascii.a2b_hex('303f373b0f0b002f060b013e380c083c303f050b030200303c0c0f083a36030a')
    rgb_palette = []
    for val in raw_palette:
        rgb_palette += palette_to_rgb(val)
    palette = ImagePalette.ImagePalette(mode='RGB', palette=rgb_palette)
    converted_image = image.convert(mode='P', palette=palette)
    width, height = converted_image.size
    tiles = []
    for tile_index in range(width//8):
        for y in range(8):
            pixels = [image.getpixel((tile_index*8+x, y)) for x in range(8)]
            for bit_index in range(4):
                packed_pixel = 0
                for x in range(8):
                    packed_pixel += (0x01 & (pixels[7-x] >> bit_index)) << x
                tiles.append(packed_pixel)
    return tiles

if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('infile')
    parser.add_argument('outfile')
    args = parser.parse_args()

    with open(args.infile, 'rb') as h_infile:
        tiles = convert_png_to_tiles(h_infile)
    with open(args.outfile, 'wb') as h_outfile:
        h_outfile.write(bytes(tiles))
