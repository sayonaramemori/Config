efiname="nvme0n1p1"
rootname="nvme0n1p2"
mkfs.fat -F 32 /dev/${efiname} && mkfs.btrfs /dev/${rootname}

mount -t btrfs /dev/${rootname} /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
umount /mnt

mount -t btrfs -o subvol=/@,compress=zstd /dev/${rootname} /mnt
mount --mkdir -t btrfs -o subvol=/@home,compress=zstd /dev/${rootname} /mnt/home
mount --mkdir /dev/${efiname} /mnt/efi


