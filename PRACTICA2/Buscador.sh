#!/bin/bash

#PARAMETRO
echo Buscar:
read palabra

#FUNCION
function buscar(){
	#CICLO
	for i in $(ls)
	do
		#VARIABLE
		contenido=$(cat $i)
		#CICLO
		for line in $contenido
		do
			#IF
			if echo $line | grep $palabra
			then
				echo Se encontro un match
			fi
		done
	done
}
buscar
