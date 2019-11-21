```shell
#!/bin/bash

# 安装 vsftpd 服务
apt-get update
apt-get install -y vsftpd

# 启动 vsftpd 服务
systemctl start vsftpd

# 设置 vsftpd 开机自启动
systemctl enable vsftpd

# 创建 FTP 用户
$username = "testftp"
$password = "testftp"
echo -e "$username\n$password" | adduser --quiet --disabled-password --home /home/$username --gecos "FTP user" $username

# 设置 FTP 用户的密码
echo -e "$password\n$password" | passwd $username

# 配置 vsftpd
cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

echo "anonymous_enable=NO" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "user_sub_token=\$USER" >> /etc/vsftpd.conf
echo "local_root=/home/\$USER" >> /etc/vsftpd.conf

# 重启 vsftpd 服务
systemctl restart vsftpd

echo "FTP 服务已搭建完成，用户名为 $username，密码已设置"
```
