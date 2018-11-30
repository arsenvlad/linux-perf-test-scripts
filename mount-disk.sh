mkdir -p /disk0
fdisk /dev/nvme0n1

mkfs -t ext4 /dev/nvme0n1p1
mount /dev/nvme0n1p1 /disk0
