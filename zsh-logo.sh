#!/usr/bin/env bash

fl_font=('3D-ASCII' '3-D' '3d' 'Electronic' 'Alpha' 'Cyberlarge' 'Jerusalem' 'larry3d' 'Slant' 'Poison' 'starwars')
echo
figlet -f "${fl_font[$((${RANDOM} % ${#fl_font[*]}))]}" "LOUIS WANG" | lolcat -f
echo                      
