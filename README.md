# VsFTP 一键安装

```shell
#!/bin/bash

#ftpd 服务
yum  -y install vsftpd

# 启动 vsftpd 服务
systemctl start vsftpd

# 设置 vsftpd 开机自启动
systemctl enable vsftpd

service vsftpd restart

# 创建 FTP 用户
username="testftp"
password="testftp"

useradd -d /var/ftp/$username $username
echo -e "$password\n$password" | passwd "$username" 

echo "FTP服务器已安装并账号密码设置完成"
```
