#!/bin/bash
program="arp-scan"

if [[ $(id -u) -ne 0 ]]; then
    echo "Este script requiere permisos de superusuario, Por favor ejecutelo con sudo"
    exit 1
fi

interface_name=$(ip route | awk '/default/ {print $5;exit}')

if command -v $program >& /dev/null; then
    arp-scan -I $interface_name --localnet
else
    apt install arp-scan -y
    clear
    arp-scan -I $interface_name --localnet
fi

