#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
rm -rf jiasu.sh
fspath="/fs/"
i=/etc/rc.local
s=speedtest_cli.sh
a=speedtest_cli.py
export PATH
clear;

ruixiezai='
========================================================
                  锐速加速器卸载成功！！！       
                  QQ免流交流群：514249305     
========================================================';
xiezai='
========================================================
                  FS加速器卸载成功！！！       
                  QQ免流交流群：514249305      
========================================================';

echo -e "\033[33m===========================================================================\033[0m"
echo -e "\033[36m                   欢迎使用杂牌军一键加速器安装  交流群：514249305\033[0m"
echo -e "\033[32m               请选择：\033[0m"
echo -e "\033[32m                       1.安装锐速加速器（国外）\033[0m"
echo -e "\033[32m                       2.安装FS加速器（国内）\033[0m"
echo -e "\033[32m                       2.卸载锐速加速器\033[0m"
echo -e "\033[32m                       4.卸载FS加速器\033[0m"            
echo -e "\033[32m                       5.服务器测速脚本\033[0m"               
echo -e "\033[33m============================================================================\033[0m"
echo -n "输入选项: " 
read mode



if [ -z $mode ] 
then
echo -e "默认安装类型：\033[32mFS加速器一键安装\033[0m" ; 
echo
wget http://binml.top/J/install_fs.sh
sleep 1
chmod 777 install_fs.sh
./install_fs.sh 2>&1 | tee install.log
chmod +x /etc/rc.local
cd /etc
sleep 1
echo 'sh /fs/start.sh'>>rc.local
clear
CopyrightLogo='
=======================================================
              恭喜，FS加速成功，请放心使用         
                QQ免流交流群：514249305       
=======================================================';
echo -e "\033[36m$CopyrightLogo\033[0m";
exit
fi




if [[ $mode == "1" ]]   
then 
if [ `uname -r` != "2.6.32-504.3.3.el6.x86_64" ]
then
echo "内核不一致，即将替换内核"
echo -e "是否确认？[y or n]"
read code
if [ $code = "y" -o $code = "Y" ]
then
echo "请等待，正在替换内核。。。"
wget http://binml.top/J/ruisu/kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm >/dev/null 2>&1
rpm -ivh kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm --force
rm -f kernel-firmware-2.6.32-504.3.3.el6.noarch.rpm
wget http://binml.top/J/ruisu/kernel-2.6.32-504.3.3.el6.x86_64.rpm >/dev/null 2>&1
rpm -ivh kernel-2.6.32-504.3.3.el6.x86_64.rpm --force
rm -f kernel-2.6.32-504.3.3.el6.x86_64.rpm
echo "内核替换完成，系统即将重启"
echo "重启系统之后请再次执行该脚本"
sleep 5
reboot
rm -f serverSpeeder.sh
exit 0
fi
fi
if [ $code = "n" -o $code = "N" ]
then
echo "程序即将退出安装"
sleep 1
rm -f serverSpeeder.sh
exit 0
fi
echo "正在安装锐速无限制版"
wget http://binml.top/J/ruisu/serverSpeeder.tar.gz >/dev/null 2>&1
tar -zxvf serverSpeeder.tar.gz >/dev/null 2>&1
bash install.sh
rm -f serverSpeeder.tar.gz >/dev/null 2>&1
rm -rf apxfiles >/dev/null 2>&1
rm -f install.sh >/dev/null 2>&1
clear
ruisu1='
=======================================================
     恭喜，锐速加速成功，请放心使用    开机自启动     
                QQ免流交流群：514249305       
=======================================================';
echo -e "\033[36m$ruisu1\033[0m";
rm -f serverSpeeder.sh
rm -f serverSpeeder.sh1
exit 0
fi


if [[ $mode == "2" ]]     
then     
echo -e "安装类型：\033[32mFS加速器一键安装\033[0m" ;
wget http://binml.top/J/install_fs.sh
sleep 1
chmod 777 install_fs.sh
./install_fs.sh 2>&1 | tee install.log
chmod +x /etc/rc.local
cd /etc
sleep 1
echo 'sh /fs/start.sh'>>rc.local
clear
CopyrightLogo='
=======================================================
                   恭喜，FS加速成功，请放心使用    开机自启动     
                         QQ免流交流群：514249305     
=======================================================';
echo -e "\033[36m$CopyrightLogo\033[0m";
rm -f install_fs.sh
exit
fi


if [[ $mode == "3" ]]     
then    
chattr -i /serverspeeder/etc/apx* && /serverspeeder/bin/serverSpeeder.sh uninstall -f >/dev/null 2>&1
if [ $? -eq 0 ];then
clear
echo -e "\033[36m$ruixiezai\033[0m";
else
clear
echo ""
echo -e "\033[33m=========================================================================\033[0m"
echo -e "\033[36m                     卸载失败，请检查是否安装了锐速加速器\033[0m"
echo -e "\033[36m                             QQ免流交流群：514249305       \033[0m"
echo -e "\033[33m==========================================================================\033[0m"
exit
fi
fi



if [[ $mode == "4" ]]     
then    
cd /fs/>/dev/null 2>&1;bash stop.sh>/dev/null 2>&1;rm -rf /fs>/dev/null 2>&1
cd /etc/
chmod 777 rc.local
sed -i.bk -e 's/start.sh/#/g' $i
sed -i.bk -e 's/sh /fs/#/g' $i
sed -i.bk -e 's/fs/#/g' $i
sleep 1
clear
echo -e "\033[33m=========================================================================\033[0m"
echo -e "\033[36m                     FS加速器卸载成功\033[0m"
echo -e "\033[36m                     QQ免流交流群：514249305        \033[0m"
echo -e "\033[33m==========================================================================\033[0m"
exit
fi



if [[ $mode == "5" ]]     
then
wget http://binml.top/J/speedtest_cli.sh
sleep 1
sudo mv $s $a
chmod a+rx speedtest_cli.py
sudo mv speedtest_cli.py /usr/local/bin/speedtest-cli
sudo chown root:root /usr/local/bin/speedtest-cli
speedtest-cli
exit
fi

