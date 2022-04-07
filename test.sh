+#!/bin/bash

#2mb
./sata_f2fs_custom.sh 1 1
#./fragment.sh
iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest

#200mb
./sata_f2fs_custom.sh 1 100
#./fragment.sh
iozone -R -b bench1.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest

#2gb
./sata_f2fs_custom.sh 1 1000
#./fragment.sh
iozone -R -b bench2.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest

#20gb
./sata_f2fs_custom.sh 1 10000
#./fragment.sh
iozone -R -b bench2.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest

#iozone -R -b reportfile -i testid -I directio -s filesize -r blocksize -a blocksizeincreases -l lowerthread# -u upperthread# -f <filelocation>
#testid: 0: write/rewrite, 1: read/reread, 2: randread/randwrite
