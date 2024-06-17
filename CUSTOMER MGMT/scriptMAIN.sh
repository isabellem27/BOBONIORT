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
MANAGEMENT_CUSTOMER='./CUSTOMER/MANAGEMENT-CUSTOMER/manacust.cbl'
CREATE_CUSTOMER_FRONT='./CUSTOMER/CREATE-CUSTOMER/ccfront.cbl'
CREATE_CUSTOMER_BACK='./CUSTOMER/CREATE-CUSTOMER/ccback.cob'
SEARCH_CUSTOMER_FRONT='./CUSTOMER/SEARCH-CUSTOMER/scfront.cbl'
SEARCH_CUSTOMER_BACK='./CUSTOMER/SEARCH-CUSTOMER/scback.cob'
MENU_CUSTOMER_FRONT='./CUSTOMER/MENU-CUSTOMER/mcfront.cbl'
MENU_CUSTOMER_BACK='./CUSTOMER/MENU-CUSTOMER/mcback.cob'
UPDATE_CUSTOMER_FRONT='./CUSTOMER/UPDATE-CUSTOMER/ucfront.cbl'
UPDATE_CUSTOMER_BACK='./CUSTOMER/UPDATE-CUSTOMER/ucback.cob'

# Compile chaque programme COBOL spécifié.
cobc -locesql -x -o run $SIGN_IN_FRONT $SIGN_IN_BACK $MANAGEMENT_CUSTOMER $CREATE_CUSTOMER_FRONT $CREATE_CUSTOMER_BACK $SEARCH_CUSTOMER_FRONT $SEARCH_CUSTOMER_BACK $MENU_CUSTOMER_FRONT $MENU_CUSTOMER_BACK $UPDATE_CUSTOMER_FRONT $UPDATE_CUSTOMER_BACK

# Exécute le programme COBOL compilé.
./run