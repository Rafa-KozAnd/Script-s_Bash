#!/bin/bash

echo "Limpando cache do Google Chrome..."

CHROME_CACHE_DIR="$HOME/.cache/google-chrome"

if [ -d "$CHROME_CACHE_DIR" ]; then
  rm -rf "$CHROME_CACHE_DIR"/*
  echo "Cache do Google Chrome limpo com sucesso!"
else
  echo "Diretório de cache do Google Chrome não encontrado."
fi
