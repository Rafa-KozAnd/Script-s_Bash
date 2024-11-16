#!/bin/bash

echo "Limpando cache do Mozilla Firefox..."

FIREFOX_CACHE_DIR="$HOME/.cache/mozilla/firefox"

if [ -d "$FIREFOX_CACHE_DIR" ]; then
  rm -rf "$FIREFOX_CACHE_DIR"/*
  echo "Cache do Mozilla Firefox limpo com sucesso!"
else
  echo "Diretório de cache do Mozilla Firefox não encontrado."
fi
