#!/bin/bash

entorno=1

for archivo in "$entorno/entrada"/*.txt;
do
    if [ -f "$archivo" ]; then
        cat "$archivo" >> "$entorno/salida/$FILENAME.txt"
        mv "$archivo" "$entorno/procesado/"
    fi
done
