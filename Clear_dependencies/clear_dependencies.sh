#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "Este script deve ser executado como root."
  exit 1
fi

echo "Iniciando limpeza de pacotes não utilizados..."

if command -v apt-get &>/dev/null; then
  echo "Usando APT para remover pacotes..."
  apt-get autoremove -y
  apt-get autoclean -y
elif command -v yum &>/dev/null; then
  echo "Usando YUM para remover pacotes..."
  yum autoremove -y
elif command -v dnf &>/dev/null; then
  echo "Usando DNF para remover pacotes..."
  dnf autoremove -y
elif command -v pacman &>/dev/null; then
  echo "Usando Pacman para limpar pacotes..."
  pacman -Rns $(pacman -Qtdq) --noconfirm
elif command -v zypper &>/dev/null; then
  echo "Usando Zypper para limpar pacotes..."
  zypper packages --unneeded
  zypper remove --clean-deps $(zypper packages --unneeded | awk '/^i/ {print $3}')
else
  echo "Gerenciador de pacotes não detectado ou não suportado."
  exit 1
fi

echo "Limpeza concluída com sucesso!"
