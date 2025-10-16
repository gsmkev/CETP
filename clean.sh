#!/bin/bash

# Script para compilar el paper LaTeX
# Elimina archivos auxiliares, compila, ejecuta bibtex y recompila

echo "=== Limpiando archivos auxiliares ==="
# Eliminar todos los archivos paper*.* excepto paper.tex
find . -maxdepth 1 -name "paper*.*" ! -name "paper.tex" -type f -delete
echo "Archivos auxiliares eliminados"

echo "=== Primera compilación ==="
# Primera compilación
pdflatex paper.tex
if [ $? -ne 0 ]; then
    echo "Error en la primera compilación"
    exit 1
fi

echo "=== Ejecutando bibtex ==="
# Ejecutar bibtex
bibtex paper
if [ $? -ne 0 ]; then
    echo "Error ejecutando bibtex"
    exit 1
fi

echo "=== Segunda compilación ==="
# Segunda compilación
pdflatex paper.tex
if [ $? -ne 0 ]; then
    echo "Error en la segunda compilación"
    exit 1
fi

echo "=== Tercera compilación ==="
# Tercera compilación
pdflatex paper.tex
if [ $? -ne 0 ]; then
    echo "Error en la tercera compilación"
    exit 1
fi

echo "=== Compilación completada exitosamente ==="
echo "El archivo paper.pdf ha sido generado"
