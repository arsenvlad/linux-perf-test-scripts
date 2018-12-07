# READ THROUGHPUT
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=64 --rw=read --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=32 --rw=read --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=8 --rw=read --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=4 --rw=read --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=2 --rw=read --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=1 --rw=read --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting

# WRITE THROUGHPUT
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=64 --rw=write --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=32 --rw=write --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=8 --rw=write --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=4 --rw=write --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=2 --rw=write --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=1 --rw=write --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting

# READ+WRITE THROUGHPUT
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=64 --rw=rw --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=32 --rw=rw --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=8 --rw=rw --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=4 --rw=rw --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=2 --rw=rw --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=1 --rw=rw --bs=1024k --size=4G --numjobs=1 --time_based --runtime=10 --group_reporting

# READ IOPS (to reach high IOPS need --numjobs >= 6)
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=64 --rw=read --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=32 --rw=read --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=8 --rw=read --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=4 --rw=read --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=2 --rw=read --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=1 --rw=read --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting

# WRITE IOPS
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=64 --rw=write --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=32 --rw=write --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=8 --rw=write --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=4 --rw=write --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=2 --rw=write --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=1 --rw=write --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting

# READ+WRITE IOPS
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=64 --rw=rw --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=32 --rw=rw --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=8 --rw=rw --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=4 --rw=rw --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=2 --rw=rw --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting
fio --directory=/disk0 --name=tempfile.dat --direct=1 --ioengine=libaio --iodepth=1 --rw=rw --bs=4k --size=4G --numjobs=8 --time_based --runtime=10 --group_reporting



