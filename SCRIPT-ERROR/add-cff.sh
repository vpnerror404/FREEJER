
#!/bin/bash
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


cd /root
echo "        Add ID Cloudlare "
echo "==============================="
read -e -p " Masukan Domain :$domain" domain
read -e -p " Masukan Email Cloudflare :" email
read -e -p " Masukan Api Key :" key
echo -e "domain=$domain" >> /root/mail.conf
echo -e "email=$email" >> /root/mail.conf
echo -e "key=$key" >> /root/mail.conf
clear
echo "Done"
echo "Your ID Cloudflare"
echo -e "==============================="
echo "DOMAIN         : $domain"
echo "Email          : $email"
echo "Api Key        : $key"
echo -e "==============================="
read -p "Tekan Enter Untuk Kembali Ke Menu....."
sleep 1
menu
exit 0
fi
