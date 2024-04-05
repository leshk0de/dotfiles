# This script initiates a python project structure

echo "Generating README.md ..."
touch README.md

echo "Generating cloudfunction structure..."
mkdir src
touch src/main.py
touch src/requirements.txt

echo "Creating terraform files..."
mkdir terraform
touch terraform/main.tf
touch terraform/variables.tf
touch terraform/output.tf

echo "Cloning .gitignore from https://github.com/leshk0de/dotfiles/blob/master/gitignore"
curl -s 'https://raw.githubusercontent.com/leshk0de/dotfiles/master/gitignore' -o .gitignore

ls -lar
