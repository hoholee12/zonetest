#!/bin/bash

#30gb
#./sata_f2fs_custom.sh 1 15000
#./fragment.sh
#./justfill.sh
#iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
#./testfio.sh zone30gb

#exit

#2mb
#./sata_f2fs_custom.sh 1 1
#./fragment.sh
#./justfill.sh
#iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
#./testfio.sh zone2mb

#20mb
#./sata_f2fs_custom.sh 1 10
#./fragment.sh
#./justfill.sh
#iozone -R -b bench0.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
#./testfio.sh zone20mb

#200mb
#./sata_f2fs_custom.sh 1 100
#./fragment.sh
#./justfill.sh
#iozone -R -b bench1.xls -i 0 -i 1 -s 10G -f /home/jeongho/mnt/iozonetest
#./testfio.sh zone200mb

#2gb
./sata_f2fs_custom.sh 1 1000
./fragment.sh
smartctl -A /dev/sdb &> results/results_smartctl_begin_2gb.txt
iostat | grep sdb &> results/results_iostat_begin_2gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_begin_2gb.txt
fi
./traceme_sata.sh trace_2gb &
blkcheck=$!
./testfio.sh zone2gb
killall blktrace
./printme.sh
rm trace_2gb*
smartctl -A /dev/sdb &> results/results_smartctl_end_2gb.txt
iostat | grep sdb &> results/results_iostat_end_2gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_end_2gb.txt
fi

#4gb
./sata_f2fs_custom.sh 1 2000
./fragment.sh
smartctl -A /dev/sdb &> results/results_smartctl_begin_4gb.txt
iostat | grep sdb &> results/results_iostat_begin_4gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_begin_4gb.txt
fi
./traceme_sata.sh trace_4gb &
blkcheck=$!
./testfio.sh zone4gb
killall blktrace
./printme.sh
rm trace_4gb*
smartctl -A /dev/sdb &> results/results_smartctl_end_4gb.txt
iostat | grep sdb &> results/results_iostat_end_4gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_end_4gb.txt
fi

#8gb
./sata_f2fs_custom.sh 1 4000
./fragment.sh
smartctl -A /dev/sdb &> results/results_smartctl_begin_8gb.txt
iostat | grep sdb &> results/results_iostat_begin_8gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_begin_8gb.txt
fi
./traceme_sata.sh trace_8gb &
blkcheck=$!
./testfio.sh zone8gb
killall blktrace
./printme.sh
rm trace_8gb*
smartctl -A /dev/sdb &> results/results_smartctl_end_8gb.txt
iostat | grep sdb &> results/results_iostat_end_8gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_end_8gb.txt
fi

#16gb
./sata_f2fs_custom.sh 1 8000
./fragment.sh
smartctl -A /dev/sdb &> results/results_smartctl_begin_16gb.txt
iostat | grep sdb &> results/results_iostat_begin_16gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_begin_16gb.txt
fi
./traceme_sata.sh trace_16gb &
blkcheck=$!
./testfio.sh zone16gb
killall blktrace
./printme.sh
rm trace_16gb*
smartctl -A /dev/sdb &> results/results_smartctl_end_16gb.txt
iostat | grep sdb &> results/results_iostat_end_16gb.txt
if [[ -f /sys/kernel/debug/f2fs/status ]]; then
	sh -c "cat /sys/kernel/debug/f2fs/status" > results/results_f2fsstat_end_16gb.txt
fi

cd results
fio_generate_plots "hello"

#iozone -R -b reportfile -i testid -I directio -s filesize -r blocksize -a blocksizeincreases -l lowerthread# -u upperthread# -f <filelocation>
#testid: 0: write/rewrite, 1: read/reread, 2: randread/randwrite
