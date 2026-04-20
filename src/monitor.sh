#!/bin/bash

# Definicje kolorw ANSI

RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
CYAN=$'\e[0;36m'
NC=$'\e[0m' # Brak koloru

echo "${CYAN}--- RAPORT ZDROWIA SYSTEMU ---${NC}"

# Sprawdzanie dysku
# df - h pokazuje dyski, awk wycina 5 kolumne z drugiej linijki czyli procenty

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# Sprawdzanie pamieci RAM
# free -m pokazuje RAM w megabajtach, awk liczy procent zuzycia

RAM_USAGE=$(free -m | awk 'NR==2 {printf "%s/%sMB (%.2f%%)", $3, $2, $3*100/$2}')

# Sprawdzanie CPU
# top -bn1 puszcza podglad raz, grep lapie linie z Cpu(s), awk symuuje uzycie us i sy

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')

echo "Zajete miejsce na dysku: ${GREEN}$DISK_USAGE${NC}"
echo "Zuzycie procesora: ${GREEN}$CPU_USAGE${NC}"
echo "Zuzycie pamieci RAM: ${GREEN}$RAM_USAGE${NC}"
echo "-------------------------------"
