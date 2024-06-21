#!/bin/bash

# Vérifie si l'exécutable existe et le supprime s'il est présent.
if [ -f "run" ]; then
    echo "Deleting old executable run..."
    rm "run"
fi

# Récupère le chemin vers le DOSSIER COPYBOOK.
COPYBOOK_DIR='./COPYBOOK'
shift

# Définis les variables d'environnement.
export COB_LDFLAGS="-Wl,--no-as-needed"
export COBCPY="$COPYBOOK_DIR"

# Chemin des programmes et sous-programmes.
SIGN_IN_FRONT='./USER/SIGN-IN/sifront.cbl'
SIGN_IN_BACK='./USER/SIGN-IN/siback.cob'
MENU_USER='./USER/MENU-USER/menudata.cbl'
STAT_FRONT='./STAT/stfront.cob'
CHARGE_FILES_FRONT='./CHARGE-FILES/cffront.cbl'
CHARGE_FILES_BACK='./CHARGE-FILES/cfback.cob'

# Compile chaque programme COBOL spécifié.
cobc -locesql -x -o run $SIGN_IN_FRONT $SIGN_IN_BACK $MENU_USER $STAT_FRONT $CHARGE_FILES_FRONT $CHARGE_FILES_BACK

# Exécute le programme COBOL compilé.
./run
 
