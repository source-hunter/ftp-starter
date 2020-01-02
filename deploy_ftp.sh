#!/bin/bash

# 安装vsftpd软件包
sudo apt-get update
sudo apt-get install vsftpd -y

# 配置vsftpd
sudo sed -i 's/anonymous_enable=YES/anonymous_enable=NO/' /etc/vsftpd.conf
sudo sed -i 's/local_enable=NO/local_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's/write_enable=NO/write_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf

# 重启vsftpd服务
sudo systemctl restart vsftpd

# 创建FTP账号
sudo useradd -m testftp -s /bin/bash
echo "testftp:testftp" | sudo chpasswd

echo "FTP服务器已安装并账号密码设置完成"
