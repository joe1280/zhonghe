#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#=================================================================#
#                             #
#                     #
#                   #
#                                                                 #
#                   #
#   地址:  dabml.87km.top                                  #
#   云免搭建交流群 307912370              #
#   我的QQ：494147290                                            #
#                                                                 #
#  （我会回复每一条消息，我不会的和不想回答的也会回复）           #
#=================================================================#
clear;
rm -f mproxy
#==========================变量储存================
IPAddress=`wget http://members.3322.org/dyndns/getip -O - -q ; echo`;
dizhi='ml.laosiji.pw/vpn';
mulu='mproxy';
#==========================================================================
Welcome='
==========================================================================
                        欢迎使用一键开放Mproxy端口-大白
                               
                         Powered by 大白 2015-2016                     
                              All Rights Reserved                  
                                                 云免搭建交流群 307912370
==========================================================================';

Error='
==========================================================================
                          一键开放Mproxy端口验证失败
                              
                   Powered by 52ML.org|大白 2015-2016                     
                              All Rights Reserved                  
                                                 云免搭建交流群 307912370
==========================================================================';

Ok='
==========================================================================
                            成功开启Mproxy端口  去享受这一切吧
                               
                       Powered by 大白 2015-2016                     
                                  All Rights Reserved                  
                                                     云免搭建交流群 307912370     
==========================================================================';


#==========================================================================
echo "$Welcome";
echo 
echo "脚本用于一键开启OpenVPN 138等共存端口"
echo 
echo -n -e "请输入授权码[\033[32m 大白 \033[0m]： "
read mm
if [ "$mm" = "大白" ] ;then
	echo 
	echo 授权成功！即将开始搭建...
    else
	echo
	echo "授权失败！"
echo "$Error";
exit 0;
fi
#设置端口
echo "请设置你要设置Mproxy转发端口"
    read -p "(回车使用将使用138端口):" Mproxy
    [ -z "$Mproxy" ] && Mproxy="138"
    echo
    echo "---------------------------"
    echo "成功设置Mproxy = $Mproxy"
    echo "---------------------------"
    echo
#开始设置
echo "请稍等，正在设置Mproxy"
cd /etc/openvpn
rm -rf mproxy
wget http://${dizhi}/${mulu}/mproxy >/dev/null 2>&1
chmod 755 /etc/openvpn/mproxy
./mproxy -l $Mproxy -d
iptables -A INPUT -p TCP --dport $Mproxy -j ACCEPT >/dev/null 2>&1 
service iptables save 
service iptables restart
#结束
clear
echo
# OpenVPN Installing ****************************************************************************
echo "$Welcome";
echo 添加成功后每次连接都会在服务器输出连接信息，不用管他
echo 
echo 希望大家多用来学习吧
echo
echo 需要开放其他端口再次执行就可以，不影响原来的模式
echo
echo 感谢你的支持，我是大白QQ494147290
echo
echo 欢迎访问我的官网：dabml.87km.top
echo "$InstallOK";
exit 0;
# OpenVPN Installation Complete ****************************************************************************