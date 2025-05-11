#!/bin/bash
# Verificar se o Python está configurado corretamente
if ! command -v python &> /dev/null; then
  echo "Python não está instalado ou não está no PATH."
  exit 1
fi

# Limpar notebooks com nb-clean
python -m nb_clean clean .

# Verificar se houve alterações após a limpeza
if [ -n "$(git status --porcelain)" ]; then
  echo "Notebooks foram limpos. Por favor, adicione as mudanças."
  git add .
fi
