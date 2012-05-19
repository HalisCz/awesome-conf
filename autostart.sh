#!/bin/bash

#xmodmap ~/.Xmodmap & 

# --- Prepinani klavesnice --- 
setxkbmap -layout cz,us -option grp:alt_shift_toggle &
# xset r

# Workaround problemu se zobrazenim java aplikaci - java 1.6
# wmname LG3D &

# --- Demon urxvt ---
urxvtd -q -f -o &
# sleep 3

# --- Pozadi plochy ---
# Nastaveno pres nitrogen v theme.lua
# nitrogen --restore &

# --- Spusteni terminalu ---
# xterm -name Terminal_1 -fa terminus -fs 11 -bg black -fg white &
# xterm -name Terminal_2 -fa terminus -fs 11 -bg black -fg white &
# xterm -name Terminal_3 -fa terminus -fs 11 -bg black -fg white &
# urxvtc &
# urxvtc &
# urxvtc &

# --- Ostatni aplikace ---
# xpad &
wicd-client &
conky -d -p 5
kgpg
zim &
# osmo &
# stardict &
# gkrellm &
# sonata --hidden & 

# Manazer schranky
# (sleep 1s && parcellite) &

# Spusteni screensaveru
xscreensaver -no-splash &

# lxpanel &
