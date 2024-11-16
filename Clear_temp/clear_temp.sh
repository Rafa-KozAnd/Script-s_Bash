#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script deve ser executado como root."
  exit 1
fi

# Diretórios que contêm arquivos temporários
DIRS=("/tmp" "/var/tmp")

# Configurações
DIAS=7 # Número de dias antes de considerar os arquivos para remoção

echo "Iniciando limpeza de arquivos temporários..."

for DIR in "${DIRS[@]}"; do
  echo "Limpando o diretório $DIR..."
  
  find "$DIR" -type f -mtime +"$DIAS" -exec rm -f {} \;
  
  find "$DIR" -type d -empty -exec rmdir {} \;
done

echo "Limpeza concluída!"
