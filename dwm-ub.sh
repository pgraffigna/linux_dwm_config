#!/bin/bash
#script para instalar DWM como gestor de ventanas en ubuntu 18.04

#Colores
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
blueColor="\e[0;34m\033[1m"
endColor="\033[0m\e[0m"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado ${endColor}"
        exit 0
}

echo -e "${yellowColor}Actualizando el sistema ${endColor}"
sudo apt update

echo -e "${yellowColor}Instalando dependencias para usar con VBOX ${endColor}"
sudo apt install -y virtualbox-guest-utils virtualbox-guest-x11

echo -e "${yellowColor}Instalando los programas ${endColor}"
sudo apt install -y dwm suckless-tools xdm dmenu xorg

echo -e "${yellowColor}Creando el archivo de sesión ${endColor}"
echo dwm > .xsession

echo -e "${blueColor}Reiniciando en 5 segundos!! ${endColor}"
sleep 5 && sudo reboot
