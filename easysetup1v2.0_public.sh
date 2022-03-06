#!/bin/bash

# -------------------------- INITIALIZING -------------------------- #

echo -e "\n\e[1;37;42m ! --- INITIAL SYSTEM UPDATES (UPDATE/UPGRADE) --- ! \e[0m\n"
sudo apt-get update && sudo apt-get upgrade -y

# -------------------------- INSTALL SNAP AND WGET -------------------------- #
echo -e "\n\e[1;37;42m ! --- SNAP AND WGET INSTALLATION --- ! \e[0m\n"
sudo apt install snapd -y
sudo apt install wget -y

# -------------------------- NORDLAYER -------------------------- #
echo -e "\n\e[1;37;42m ! --- NORDLAYER INSTALLATION --- ! \e[0m\n"
if command -v nordlayer
then   
    echo 'NordLayer already installed!'
else
    echo 'Installing NordLayer!'
    wget https://downloads.nordlayer.com/linux/latest/nordlayer-latest_1.0.0_all.deb
    sudo apt-get install ./nordlayer-latest_1.0.0_all.deb
    sudo apt-get update
    sudo apt-get install nordlayer
    sudo usermod -a -G nordlayer $(whoami)

    # Login needs to be into a second SH program, to run after reboot #

    if command -v nordlayer
    then
        echo 'Installation complete - it will take effect after the reboot!'
    fi
fi

# -------------------------- CUSTOM VPN COMMANDS -------------------------- #
echo "\n! --- CUSTOM COMMANDS FOR VPN CREATION --- !\n"

echo    'alias vpn-connect-[region]="#Custom NordVPN Connect [region]
        sudo nordlayer connect hostinger-vpn-[region_code]
        sudo nordlayer status"' >> ~/.bashrc

source ~/.bashrc

echo 'Custom commands created!'

# -------------------------- IPv6 -------------------------- #
echo -e "\n\e[1;37;42m ! --- DISABLING IPV6 THROUGH GRUB --- ! \e[0m\n"
echo    'GRUB_DEFAULT=0
        GRUB_TIMEOUT_STYLE=hidden
        GRUB_TIMEOUT=0
        GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
        GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"
        GRUB_CMDLINE_LINUX="ipv6.disable=1"
        GRUB_DISABLE_OS_PROBER=true' > /etc/default/grub
sudo update-grub

echo 'IPv6 disabled!'

# -------------------------- NORDPASS -------------------------- #
echo -e "\n\e[1;37;42m ! --- NORDPASS INSTALLATION --- ! \e[0m\n"
sudo snap install nordpass

# -------------------------- SLACK -------------------------- #
echo -e "\n\e[1;37;42m ! --- SLACK INSTALLATION --- ! \e[0m\n"
sudo snap install slack --classic

# -------------------------- CHROME -------------------------- #
echo -e "\n\e[1;37;42m ! --- GOOGLE CHROME INSTALLATION --- ! \e[0m\n"
if command -v chrome
then   
    echo 'Chrome already installed!'
else
    echo 'Installing Chrome!'
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo rm google-chrome-stable_current_amd64.deb

    if command -v chrome
    then
        echo 'Chrome Installation complete!'
    fi
fi


# -------------------------- FLAMESHOT -------------------------- #
echo -e "\n\e[1;37;42m ! --- FLAMESHOT INSTALLATION --- ! \e[0m\n"
sudo apt install flameshot -y

# -------------------------- FILEZILLA -------------------------- #
echo -e "\n\e[1;37;42m ! --- FILEZILLA INSTALLATION --- ! \e[0m\n"
sudo apt install filezilla -y

# -------------------------- FINAL WARNING -------------------------- #
echo -e "\n\e[1;37;42m ! --- REBOOT REQUIRED --- ! \e[0m\n"
echo "After saving your work, restart your device or run the command: 'sudo reboot'"