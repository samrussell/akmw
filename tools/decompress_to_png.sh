FILENAME=$1
python3 tools/decompress-4bpp-tiles.py src/graphics/${FILENAME}.bin build/${FILENAME}.bin
python3 tools/tiles-to-png.py build/${FILENAME}.bin src/graphics/compressed/${FILENAME}.png