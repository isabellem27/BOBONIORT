#!/bin/bash

# Ce script prend deux arguments en ligne de commande :
# 1. Le chemin du répertoire contenant les copybooks (dossier COPYBOOK).
# 2. Le nom du programme à pré-compilé.

# Exemple d'utilisation :
# ./scriptOCESQL.sh ./COPYBOOK my_program

# Cela signifie :
# - Le chemin de ce script.
# - Le chemin du répertoire contenant les copybooks qui correspond au dossier COPYBOOK.
# - Le nom du programme à pré-compilé qui correspond à "my_program".

# Le script va alors :
# - Vérifier s'il y a exactement deux arguments passés.
# - Supprimer l'ancien fichier pré-compilé "my_program.cob" s'il existe.
# - Définir les variables d'environnement nécessaires, COB_LDFLAGS et COBCPY.
# - Pré-compilé le programme COBOL "my_program.cbl" en utilisant "ocesql", générant un fichier "my_program.cob".

# Vérifie qu'au moins deux arguments sont spécifiés
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory_path> <program_name>"
    exit 1
fi

# Définis le nom du programme et le chemin du répertoire des copybooks à partir des arguments passés en ligne de commande.
COPYBOOK_DIR=$1
PROGRAM=$2

# Vérifie si le programme pré-compilé existe et le supprime s'il existe.
if [ -f "$PROGRAM.cob" ]; then
    echo "Deleting old precompiled program $PROGRAM..."
    rm "$PROGRAM.cob"
fi

# Définis les variables d'environnement.
export COB_LDFLAGS="-Wl,--no-as-needed"
export COBCPY="$COPYBOOK_DIR"

# Pré-compile avec ocesql
ocesql $PROGRAM.cbl $PROGRAM.cob