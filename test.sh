#!/bin/bash

#30gb
./sata_f2fs_custom.sh 1 15000
./fragment.sh
#./justfill.sh
#iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
./testfio.sh zone30gb

exit

#2mb
./sata_f2fs_custom.sh 1 1
./fragment.sh
#./justfill.sh
#iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
./testfio.sh zone2mb

#20mb
./sata_f2fs_custom.sh 1 10
./fragment.sh
#./justfill.sh
#iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
./testfio.sh zone20mb

#200mb
./sata_f2fs_custom.sh 1 100
./fragment.sh
#./justfill.sh
#iozone -R -b bench1.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
./testfio.sh zone200mb

#2gb
./sata_f2fs_custom.sh 1 1000
./fragment.sh
#./justfill.sh
#iozone -R -b bench2.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
./testfio.sh zone2gb

#20gb
./sata_f2fs_custom.sh 1 10000
./fragment.sh
#./justfill.sh
#iozone -R -b bench2.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
./testfio.sh zone20gb

cd results
fio_generate_plots "hello"

#iozone -R -b reportfile -i testid -I directio -s filesize -r blocksize -a blocksizeincreases -l lowerthread# -u upperthread# -f <filelocation>
#testid: 0: write/rewrite, 1: read/reread, 2: randread/randwrite
