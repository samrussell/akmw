mkdir -p tmp build

rm -f tmp/* 

mkdir build/sprites
mkdir build/sprites/compressed
mkdir build/sprites/uncompressed

echo Generating sprites
python3 tools/png-to-tiles.py src/graphics/4bppCharacters.png build/sprites/4bppCharacters-decompressed.bin
python3 tools/compress-4bpp-tiles.py build/sprites/4bppCharacters-decompressed.bin build/sprites/4bppCharacters.bin
for file in src/graphics/boxes/*.png; do name=$(basename "${file%.*}"); python3 tools/png-to-tiles.py $file build/sprites/$name.bin ; done
# compressed sprites
for file in src/graphics/compressed/*.png; do name=$(basename "${file%.*}"); python3 tools/png-to-tiles.py $file build/sprites/uncompressed/$name.bin ; done
for file in build/sprites/uncompressed/*.bin; do name=$(basename "${file%.*}"); python3 tools/compress-4bpp-tiles.py $file build/sprites/compressed/$name.bin ; done
# uncompressed sprites
for file in src/graphics/uncompressed/*.png; do name=$(basename "${file%.*}"); python3 tools/png-to-tiles.py $file build/sprites/uncompressed/$name.bin ; done

echo Compiling
wla-z80 -I src -D _REV0 -o tmp/baserom_rev0.o src/baserom.asm
wla-z80 -I src -D _REV1 -o tmp/baserom_rev1.o src/baserom.asm

rm -f build/*

echo Linking
wlalink -d -S -b linkfile_rev0 build/alex-kidd-in-miracle-world-usa-europe.sms
wlalink -d -S -b linkfile_rev1 build/alex-kidd-in-miracle-world-usa-europe-rev-1.sms


STATUS=0
if ! sha1sum --status -c <<<"8cecf8ed0f765163b2657be1b0a3ce2a9cb767f4 *build/alex-kidd-in-miracle-world-usa-europe.sms"; then
    echo "REV0 Diff :/"
    STATUS=1
else
    echo "REV0 Ok!"
fi

if ! sha1sum --status -c <<<"6d052e0cca3f2712434efd856f733c03011be41c *build/alex-kidd-in-miracle-world-usa-europe-rev-1.sms"; then
    echo "REV1 Diff :/"
    STATUS=1
else
    echo "REV1 Ok!"
fi

exit $STATUS
