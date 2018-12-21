#!/bin/bash
#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }
sudo apt-get -y update && sudo apt-get -y install python3 git
cd ~
git clone https://github.com/aploium/zmirror-onekey.git --depth=1
cd zmirror-onekey
sudo python3 deploy.py
rm -rf ~/*
sudo systemctl enable cron.service
sudo systemctl start cron.service
echo 'dns-nameservers 8.8.8.8' /etc/network/interfaces
touch /etc/MyCrontab
echo 'SHELL=/bin/bash' >> /etc/MyCrontab
echo 'PATH=/sbin:/bin:/usr/sbin:/usr/bin' >> /etc/MyCrontab
echo '0    0    *    *    * wget https://raw.githubusercontent.com/sy618/hosts/master/FQ -O hosts&&cp hosts /etc/&&rm -rf hosts' >> /etc/MyCrontab
echo '0    2    *    *    *    /sbin/shutdown -r' >> /etc/MyCrontab
crontab /etc/MyCrontab
echo "
            **           **        
        *       *     *       *    
      *            *            *  
     *                           * 
     *                           * 
     *         91vps.win         * 
     *                           * 
      *                         *  
       *                       *   
        *                     *    
          *                 *      
            *             *        
              *         *          
                 *   *             
                   *               
" 