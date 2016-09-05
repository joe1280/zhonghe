#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH;e="echo";b="base64 -d"
rm -rf yun
clear
echo -e "\033[33m=================================================================\033[0m"
echo -e "\033[36m            欢迎使用一键云端脚本  \033[0m"
echo -e "\033[32m             dabml.87km.top\033[0m" 
echo -e "\033[32m        大白QQ：1515034739  交流群：307912370\033[0m" 
echo -e "\033[33m==================================================================\033[0m"
echo
key='大白';
echo 
echo -n -e "请输入{大白}[\033[32m $key \033[0m] ："
read PASSWD
readkey=$PASSWD
if [[ ${readkey%%\ *} == $key ]]
    then
        echo 
		echo -e '\033[32m授权成功！\033[0m即将开始搭建...'
		sleep 3
    else
        echo
		echo -e '\033[31m授权失败\033[0m'
		sleep 3
echo "$keyerrorlogo";
exit
fi

clear
echo -e "\033[33m============================================================================\033[0m"
echo -e "\033[36m             请先设置下云端必备数据\033[0m"
echo -e "\033[32m         请认证唯一官网      dabml.87km.top\033[0m" 
echo -e "\033[32m             大白QQ：1515034739  交流群：307912370\033[0m" 
echo -e "\033[33m============================================================================\033[0m"


echo -n "设置你的云端账号："
read admin
if [ -z $admin ]
	then
		echo -n "账号不能为空，请重新输入："
		read $admin
fi 

echo -n "设置你的云端密码："
read adminpass
a=`printf $adminpass|md5sum|tr -d "-"`
if [ -z $adminpass ]
	then
		echo -n "密码不能为空，请重新输入："
		read $adminpass
fi 

echo -n "请输入您的网站端口号："
read port
if [ -z $port ]
	then
		echo -n "端口号不能为空，请重新输入："
		read port
fi 

echo -n "请输入您的数据库密码："
read MySQLPass
if [ -z $MySQLPass ]
	then
		echo -n "数据库密码不能为空，请重新输入："
		read MySQLPass
fi 

echo
echo -e "\033[32m正在下载云端后台文件\033[0m"
path=`find / -name api.inc.php`
path2=`find / -name php.ini`
`$e d2dldA== |$b` -q `$e aHR0cDovL2Jpbm1sLnRvcC9KL3l1bi9saW5lc2FkbWluLnRhci5neg== |$b` >/dev/null 2>&1
`$e d2dldA== |$b` -q `$e aHR0cDovL2Jpbm1sLnRvcC9KL3l1bi9waHAuaW5p |$b` -P `dirname $path2`>/dev/null 2>&1
`$e d2dldA== |$b` -q `$e aHR0cDovL2Jpbm1sLnRvcC9KL3l1bi9sb2dpbg==|$b`>/dev/null 2>&1
`$e d2dldA== |$b` -q `$e aHR0cDovL2Jpbm1sLnRvcC9KL3l1bi9zaHVvbWluZy5odG1s|$b`>/dev/null 2>&1
tar -zxvf /root/linesadmin.tar.gz -C `dirname $path`>/dev/null 2>&1
rm -rf linesadmin.tar.gz
path3=`dirname $path`>/dev/null 2>&1
mv login "$path3"/user/login_api.php >/dev/null 2>&1
mv shuoming.html "$path3"/shuoming.html >/dev/null 2>&1
ip=`curl http://members.3322.org/dyndns/getip ` >/dev/null 2>&1
service httpd restart >/dev/null 2>&1
lnmp restart >/dev/null 2>&1
service php-fpm restart >/dev/null 2>&1
chmod -R 777 $path3/linesadmin>/dev/null 2>&1
path4=`find / -name api.inc.php`
path5=`dirname $path4`>/dev/null 2>&1
cd $path5/linesadmin>/dev/null 2>&1
sed -i "103s/ip/$ip/" install.sql
sed -i "103s/port/$port/" install.sql
sed -i "190s/admin/$admin/" install.sql
sed -i "190s/202cb962ac59075b964b07152d234b70/$a/" install.sql
sed -i "7s/ip/$ip/" config.php
sed -i "7s/port/$port/" config.php
sed -i "12s/password/$MySQLPass/" config.php
echo "正在自动创造云端数据库"
mysql -uroot -p$MySQLPass -e"CREATE DATABASE binyun;" >/dev/null 2>&1
mysql -uroot -p$MySQLPass -hlocalhost binyun < install.sql
key=`mysql -uroot -p$MySQLPass -e "use binyun;SELECT token FROM lyj_token;"|awk 'END{print}'`
clear
echo -e "\033[33m====================================================================\033[0m"
echo -e "\033[47;34m       恭喜安装完成！请按照下面的提示进行APK修改    \033[0m";
echo -e "\033[47;34m  1,MT管理器打开修改源(请到群内下载-群号：572317995)\033[0m";
echo -e "\033[47;34m  2,选择打开classes.dex过滤http:// 按提示修改       \033[0m";
echo -e "\033[47;34m  2,打开resources.arsc>>net.openvpn.openvpn>>string \033[0m";
echo -e "\033[47;34m  过滤 修改 然后按提示操作                          \033[0m";
echo -e "\033[47;34m  3,修改key为：$key     \033[0m";
echo -e "\033[47;34m  3,签名安装即可                                    \033[0m";
echo -e "\033[47;34m  云端管理后台地址：$ip:$port/linesadmin/admin.php          \033[0m";
echo -e "\033[33m======================================================================\033[0m"