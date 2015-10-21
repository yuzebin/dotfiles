#sudo /Library/StartupItems/VirtualBox/VirtualBox restart
echo "启动 VirtualBox 内核 ..."
sudo /Library/Application\ Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh restart >  /dev/null 2>&1 
echo "启动 VirtualBox 内核 ok !!!"

#echo "创建 RamDisk 临时目录 ..."
#echo "创建 RamDisk 临时目录 ok !!!"

echo "启动 moinmoin 服务 ..."
moin --config-dir '/Users/yuzebin/Documents/mbp13_sync/moin/zebinki/' server standalone --hostname '127.0.0.1' --port '8888' >  /dev/null 2>&1 

