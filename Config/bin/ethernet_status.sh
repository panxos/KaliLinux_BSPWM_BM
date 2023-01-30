#!/bin/sh

# Este Script esta modificado para equipos laptos/notebook, que solo tiene Wifi
# pero que se puede instalar modulos USB Network, o Dongle, por lo cual primero verifica las
# interfaces y luego imprime segun su estado si esta conectado o no.
# al configurar verificar como se muestran als interfaces
# se puede utilizar el comnando: ifconfig

# Atte Francisco Aravena  - contacto@soporteinfo.net - www.soporteinfo.net
# Creditos al scrip base S4vitar - ZlCube

if ip addr show wlan0 | grep -q "state UP"; then
    echo "%{F#00FF00} %{F#ffffff}$(ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)%{u-}"
else
  if ip addr show eth0 | grep -q "Device "eth0" does not exist"; then
    echo "Desconectado"
else
    echo "%{F#7dcfff} %{F#ffffff}$(ip addr show eth0 | grep "inet " | awk '{print $2}' | cut -d/ -f1)%{u-}"
  fi
fi