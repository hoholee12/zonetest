#!/bin/bash

./sata_f2fs_custom.sh 1 1
#./fragment.sh
iozone -R -b bench0.xls -i 0 -n 512m -g 10g -f /home/jeongho/mnt/fiotest

./sata_f2fs_custom.sh 1 100
#./fragment.sh
iozone -R -b bench1.xls -i 0 -n 512m -g 10g -f /home/jeongho/mnt/fiotest

./sata_f2fs_custom.sh 1 10000
#./fragment.sh
iozone -R -b bench2.xls -i 0 -n 512m -g 10g -f /home/jeongho/mnt/fiotest

#iozone -R -b reportfile -i testid -n minfilesize -g maxfilesize -r blocksize -a blocksizeincreases -l lowerthread# -u upperthread# -f <filelocation>
#testid: 0: write/rewrite, 1: read/reread, 2: randread/randwrite
