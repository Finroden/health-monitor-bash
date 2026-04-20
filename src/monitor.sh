#!/bin/bash

echo "--- RAPORT ZDROWIA SYSTEMU ---"

# Sprawdzanie dysku
# df - h pokazuje dyski, awk wycina 5 kolumne z drugiej linijki czyli procenty

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# Sprawdzanie pamieci RAM
# free -m pokazuje RAM w megabajtach, awk liczy procent zuzycia

RAM_USAGE=$(free -m | awk 'NR==2 {printf "%s/%sMB (%.2f%%)", $3, $2, $3*100/$2}')

echo "Zajete miejsce na dysku: $DISK_USAGE"
echo "Zuzycie pamieci RAM: $RAM_USAGE"
echo "-------------------------------"
