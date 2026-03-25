#!/bin/bash

entorno=$1
export FILENAME=resultado

if [[ "$1" == "-d" ]]; then
    rm -r "$entorno"
    pkill -f consolidar.sh
    exit
fi

while true
do
    echo "Seleccione una opcion"
    echo "---MENU---"
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Lista de alumnos"
    echo "4) 10 notas mas altas"
    echo "5) Datos de alumnos"
    echo "6) Salir"

    read opcion

    case $opcion in
        1)
            mkdir "$entorno"
            mkdir "$entorno/entrada"
            mkdir "$entorno/salida"
            mkdir "$entorno/procesado"
            echo "Se creo el entorno."
            ;;
        2)
            bash "$entorno-consolidar.sh" "$entorno" &
            ;;

        3)
            archivo="$entorno/salida/$FILENAME.txt"
            if [ -f "$archivo" ]; then
            sort -k1 -n "$archivo"

            else
                echo "No existe el archivo."
            fi
            ;;
        4)
            archivo="$entorno/salida/$FILENAME.txt"
            if [ -f "$archivo" ]; then
            sort -k5 -n -r "$archivo" | head -n 10

            else
                echo "No existe el archivo."
            fi
            ;;
        5)
            archivo="$entorno/salida/$FILENAME.txt"
            if [ -f "$archivo" ]; then
                echo "Ingresa un numero de padron: "
                read padron
                grep "^$padron " "$archivo"
            else
                echo "No existe alumno con ese numero de padron."
            fi
            ;;        


        6)
            echo "Adios."
            break
            ;;
        *)
            echo "Seleccione una de las opciones del menu."
            ;;
    esac
done
