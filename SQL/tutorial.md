## Tutorial

Ouvrir le terminal au niveau du répertoire où vous aurez copié les fichiers suivants:
boboniort-full-demo.sql
runvil
villesz.csv

Créer la base boboniortdb dans psql:
createdb boboniortdb;

Ouvrir la base boboniortdb sous psql:
psql -d boboniortdb
appliquer le script boboniort-full-demo.sql
\i boboniort-full-demo.sql
sortir de psql:
\q
Exécuter l'exécutable runvil. (Déposer l'exécutable et le fichier villesz.csv dans le même répertoire.)
Ouvrir le terminal au niveau de ce répertoire et exécuter runvil (normalement vous y êtes déjà si vous avez suivi la première instruction.
./runvil
Voilà. votre base est prête, bonne découverte de notre application.