#!/bin/bash
# Update 28-03-2024
# Rizz

Green="\e[92;1m"
RED="\033[1;31m"
BG_RED="\033[41;97;1m" # BG MERAH
BG_BLUE="\033[44;97;1m" # BG BIRU
CYAN="\033[96;1m"
NC='\033[0m'
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
red='\e[1;31m'
green='\e[0;32m'
Xark="\033[0m"
Orange='\033[0;33m'

##############################
buyer=$(wget -qO- https://vijay.hitam.id/win/installer/user/lutfifakee/lutfifakee/)
buyerexp=$(wget -qO- https://vijay.hitam.id/win/Lutfifakee/windows/main/tgl)
versi=$(wget -qO- https://vijay.hitam.id/win/installer/versido/)

##############################
today=$(date -d "0 days" +"%Y-%m-%d")
valid=$buyerexp

# // DAYS LEFT
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))

if [[ $certifacate -gt 10000 ]]; then
    sisa="LIFETIME"
else
    sisa=$(echo -e "$certifacate Days")
fi
##############################
length=13
charset="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
str=""
Manufacturer=$(dmidecode -t1 | grep Manufacturer | awk '{print $2}')

if [[ "$Manufacturer" == "Linode" ]]; then
    prov="${green}LINODE${NC}"
elif [[ "$Manufacturer" == "DigitalOcean" ]]; then
    prov="${BLUE}DigitalOcean${NC}"
else
    prov="${red}UNKNOWN${NC}"
fi

pass="Hackerslot1337@"

# Buat loop sebanyak jumlah karakter
for i in $(seq 1 $length); 
do
    # Ambil karakter random
    char=${charset:$(($RANDOM%${#charset})):1}
    
    # Tambahkan ke string
    str="$str$char"
done

##############################
clear
if [[ "$today" > "$valid" ]]; then
  echo -e "${BG_RED}        Script kadaluwarsa. Hubungi admin untuk memperbarui.${NC}"
  echo -e "${BG_RED}[ERROR] contact admin :                                     ${NC}"
  echo -e "${BG_RED}        Email: HACKNCORP@gmail.com                ${NC}"
  exit 1  # Keluar dengan kode error 1
fi

while true; do
    clear
    echo -e "${green} ┌────────────────────────────────────────────┐ ${NC}"
    echo -e "${green} │${NC} ${YELLOW}Version         :${NC} ${red}$versi${NC}"
    echo -e "${green} │${NC} ${YELLOW}Creator         :${NC} ${red}Lutfifakee${NC}"
    echo -e "${green} │${NC} ${YELLOW}Client Name     :${NC} ${red}$buyer${NC}"
    echo -e "${green} │${NC} ${YELLOW}Provider        :${NC} $prov"
    echo -e "${green} │${NC} ${YELLOW}Expiry In       :${NC} ${red}$sisa${NC}"
    echo -e "${green} └────────────────────────────────────────────┘ ${NC}"
    echo -e "${red}┌────────────────────────┐${NC}"
    echo -e "${CYAN}  1) Windows 2019${NC}"
    echo -e "${red}└────────────────────────┘${NC}"
    echo -e ""
    read -p "$(echo -e $YELLOW"Pilih (1-6): "$NC)" PILIHOS

    case "$PILIHOS" in
        1) PILIHOS="https://vijay.hitam.id/win/win2019.xz"  IFACE="Ethernet 3"  IFACEA="Ethernet 4"  OS="2019";;
        *) 
            echo -e "${YELLOW}Pilih (1-6): ${NC}"
            continue
            ;;
    esac

    if [[ "$Manufacturer" == "Linode" ]]; then
       echo -e ""
       echo -e "${BLUE}Provider Detected (${green}Linode${NC})${NC}"
       echo -e "${green}Your Provider Is Supported${NC}"
       echo -e "${YELLOW}Masukkan Linode API token:${NC}"
       read linodeapi
    elif [[ "$Manufacturer" == "DigitalOcean" ]]; then
       echo -e ""
       echo -e "${BLUE}Provider Detected (${green}DigitalOcean${NC})${NC}"
       echo -e "${green}Your Provider Is Supported${NC}"
       linodeapi=""
       sleep 2
       read -n 1 -s -r -p "Press any key to continue..."
    else
       echo -e ""
       echo -e "${BLUE}Provider Detected (${red}Unknown/Untested${NC})${NC}"
       echo -e "${red}Provider Tidak Tersedia, Jika ingin request${NC}"
       echo -e "${red}Contact Develop zeddgans${NC}"
    fi

    clear
    echo -e "${red}┌────────────────────────────────┐${NC}"
    echo -e "        ${BG_BLUE}Installing....${NC}"
    echo -e "${red}└────────────────────────────────┘${NC}"
    apt update >/dev/null 2>&1
    wget --no-check-certificate -qO RDP.sh 'https://vijay.hitam.id/win/InstallNET.sh' && chmod a+x RDP.sh
    bash RDP.sh -windows $OS --pwin $pass --eth1 "'$IFACE'" --eth2 "'$IFACEA'" --insid $str --mmbr $buyer --apilinode $linodeapi
    break
done
