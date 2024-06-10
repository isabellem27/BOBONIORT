#!/bin/bash

# Ce script prend au moins deux arguments en ligne de commande :
# 1. Le chemin du répertoire contenant les copybooks (dossier COPYBOOK).
# 2. Le nom du premier fichier COBOL à compiler.
# Suivi éventuellement par d'autres fichiers COBOL à compiler.

# Exemple d'utilisation :
# ./scriptCOBC.sh ./COPYBOOK my_program1.cbl my_program2.cob my_program3.cbl

# Cela signifie :
# - Le chemin de ce script.
# - Le chemin du répertoire contenant les copybooks qui correspond au dossier COPYBOOK.
# - Les noms des fichiers COBOL à compiler, tels que "my_program1.cbl", "my_program2.cbl", etc.

# Le script va alors :
# - Vérifier s'il y a au moins deux arguments passés.
# - Supprimer l'ancien exécutable "run" s'il existe.
# - Définir les variables d'environnement nécessaires, COB_LDFLAGS et COBCPY.
# - Compiler chaque fichier COBOL spécifié en utilisant "cobc" et générer un exécutable "run".
# - Exécuter le programme COBOL compilé.

# Vérifie qu'au moins deux arguments sont spécifiés
if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory_path> <fichier1.cbl> [<fichier2.cob> ...]"
    exit 1
fi

# Vérifie si l'exécutable existe et le supprime s'il est présent.
if [ -f "run" ]; then
    echo "Deleting old executable run..."
    rm "run"
fi

# Récupère le chemin vers le DOSSIER COPYBOOK à partir du premier argument
COPYBOOK_DIR=$1
shift

# Définis les variables d'environnement.
export COB_LDFLAGS="-Wl,--no-as-needed"
export COBCPY="$COPYBOOK_DIR"

# Compile chaque programme COBOL spécifié.
cobc -locesql -x -o run "$@"

# Exécute le programme COBOL compilé.
./run