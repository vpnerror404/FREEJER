#!/bin/bash
echo "Tukar Domain?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) make install ; break ;;
        No) exit ;;
    esac
done
clear

echo -e "Masukkan Domain"
read -p "Hostname / Domain: " host
rm -f /var/lib/crot-script/ipvps.conf
rm -f /var/lib/premium-script/ipvps.conf
rm -f /etc/v2ray/domain
clear
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo -e "Masukkan Domain Sekali Lagi"
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain

echo "Checking VPS"
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/vpnerror404/ipsec/main/ipsec | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e ""
else
echo "You're not Allowed to use this script"
exit 0
fi
