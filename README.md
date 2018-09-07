#!/bin/bash -eu
setxkbmap -option ctrl:nocaps
xmodmap -e 'keycode 255=space'
xmodmap -e 'keycode 65=Shift_L'

#!/bin/bash -eu
setxkbmap -option ctrl:nocaps
xmodmap -e 'keycode 255=space'
xmodmap -e 'keycode 65=Shift_L'
xcape -e '#65=space'
xcape -e '#64=Muhenkan'
xcape -e '#108=Henkan'

---

sudo apt install build-essential cmake git pandoc w3m vim-gtk xcape clipit libboost-all-dev
sudo apt install gnome virtualbox shutter
sudo timedatectl set-local-rtc 1
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

---

wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks 

---

sudo snap install pycharm-professional --classic

---

lsmod | grep -i nouveau
sudo vim /etc/modprobe.d/blacklist-nouveau.conf
blacklist nouveau
options nouveau modeset=0

sudo update-initramfs -u
reboot

sudo service lightdm stop
chmod 775 cuda関係
sudo ./cuda関係

---

conda create -n HOGE pip python=3.6
source activate HOGE
source deactivate
conda remove -n HOGE --all

---

sudo apt-get install network-manager-openconnect
sudo ./vpnsetup.sh 
sudo systemctl daemon-reload
sudo systemctl start vpnagentd.service
