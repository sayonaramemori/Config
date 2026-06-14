ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
timedatectl set-timezone Asia/Shanghai

vim /etc/locale.gen && locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "CialloArch" > /etc/hostname

echo "Change Password"
passwd 
