#!/bin/bash
#configurando conky en DWM

#Colores
greenColor="\e[0;32m\033[1m"
redColor="\e[0;31m\033[1m"
yellowColor="\e[0;33m\033[1m"
endColor="\033[0m\e[0m"

trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${redColor}Programa Terminado por el usuario ${endColor}"
        exit 0
}

echo -e "${yellowColor}Instalando Conky ${endColor}"
sudo apt install -y conky

echo -e "${yellowColor}Creando archivos de configuración ${endColor}"
echo -e "\n(conky | while read LINE; do xsetroot -name \"\$LINE\"; done) &\nexec dwm" >> ~/.xsession

mkdir -p ~/.config/conky && touch ~/.config/conky/conky.conf 

{
echo ' conky.config = {'
echo ' out_to_console = true,'
echo ' out_to_x = false,'
echo ' background = false,'
echo ' update_interval = 2,'
echo ' total_run_times = 0,'
echo ' use_spacer = 'none','
echo ' };'
echo ' conky.text = [['
echo ' $mpd_smart :: ${cpu cpu1}% / ${cpu cpu2}% ${loadavg 1} ${loadavg 2 3} :: ${acpitemp}c :: $memperc% ($mem) :: ${downspeed eth0}K/s ${upspeed eth0}K/s :: ${time %a %b %d %I:%M%P}'
echo ' ]];'
} >> ~/.config/conky/conky.conf

echo -e "${greenColor}Todos los procesos terminaron correctamente!! ${endColor}"