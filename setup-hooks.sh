#!/bin/bash

# Diretório onde os hooks estão armazenados
hooks_directory=".githooks"

# Diretório do Git
git_directory=".git"

# Copia os hooks para a pasta do Git
cp -R "$hooks_directory"/* "$git_directory/hooks/"

echo "Hooks copiados com sucesso para $git_directory/hooks/"