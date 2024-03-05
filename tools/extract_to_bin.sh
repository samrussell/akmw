FILENAME=$1
START=$2
END=$3
dd bs=1 skip=$(($START)) count=$(($END - $START + 1)) if=build/alex-kidd-in-miracle-world-usa-europe.sms of=src/graphics/${FILENAME}.bin