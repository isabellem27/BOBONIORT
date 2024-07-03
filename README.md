


# COBOL-P3-HDF-BOBONIORT&nbsp;&nbsp;&nbsp;<img src="./boboniort.png" />
<br>
<br>
Voici l'application développée au cours de notre mois de stage en organisation agile.
Le sujet: Nous avons reçu un courrier de la société Boboniort pour développer un écosystème applicatif afin d'améliorer l'efficacité de ses opérations internes.
<br>
<br>
<img src="./boboniort.png" />
La demande était la suivante:
Développer en COBOL
Fournir une interface conviviale permettant la saisie et la consultation faciles des informations.
Les écrans devront avoir des fonctionnalités de recherche et de filtrage pour accéder rapidement aux données pertinentes.
Automatiser les processus manuels.
<br>
<br>
Les fonctionnalités requises:
Gestion des adhérents : enregistrement, modification et archivage des informations personnelles,
médicales et administratives des adhérents.
Gestion des cotisations : calcul, facturation et suivi des paiements des cotisations des adhérents.
Gestion des remboursements : enregistrement, traitement et suivi des demandes de
remboursement des adhérents.
Gestion des prestations : attribution et suivi des prestations en fonction des garanties souscrites par
les adhérents.
Génération de rapports : production de rapports personnalisés pour la direction, les services
administratifs et les adhérents.
<br>
<br>
Notre groupe d'apprenants a répondu à l'appel d'offre.
<br>
<br>
Vous trouverez ici le cahier des charges fonctionnel, la documentation technique, la documentation utilisateur, le powerpoint de présentation et biensur l'application.
<br>
N'ayant que 3 semaines à 8 personnes pour aboutir à une proposition viable, nous avons découpé le projet en 3 phases et avons développé la première phase.
<br>
<br>
L'application permet donc de 
gérer les adhérents: Recherche d'un adhérent , création d'un adhérent, archivage d'un adhérent.
gérer les prestations: 3 contrat types sont chargé dans la base, ils sont proposés par défaut, mais l'utilisateur peut personnaliser le contrat. Le coût mensuel du contrat est calculé immédiatement.
gérer les cotisations: le coût du contrat est calculé au moment de l'affectation. L'utilisateur peut saisir un montant de versement et déclencher une facturation.
gérer les rapports: une seconde application propose divers statistiques afin de fournir une premier niveau de rapport.
Cette même application charge un fichier csv fourni par le client afin d'avoir un jeu de données plus important pour la partie client. Le fichier a été chargé dans une table de travail, les données ont été reformatées puis charger dans la table des adhérents.  

les phases suivantes permettront la modification du contrat, la relance, la gestion des remboursements, d'autres rapports/statistiques à définir avec le client.
<br>
<br>
Pour utiliser l'application, récupérez les éléments fournis dans ce github.
<br>
Commencez par créer la base postgres dans votre environnement.
Nom: boboniortdb, user: cobol, mot de passe: cbl85
ouvrez la fenêtre du terminal dans le répertoire SQL et dans l'ordre, appliquez le script BoBoniort-full-demo.sql.
par \q sortez de plsql, puis exécutez l'exécutable runvil.
Votre base est prête.
<br>
<br>
Appropriez vous le script d'exécution scriptMAIN.sh par la ligne de commande suivante: sed -i -e 's/\r$//' scriptMAIN.sh
Puis lancez le script ./CUSTOMER-MGMT/scriptMAIN.sh pour voyager dans l'application principale.
<br>
<br> 
Appropriez vous le script d'exécution script-compile.sh par la ligne de commande suivante: sed -i -e 's/\r$//' script-compile.sh
Lancez le script ./DATA-MGMT/scriptMAIN.sh pour accéder à l'application annexe.
Vous pourrez visualiser les statistiques et charger le fichier csv (attention cette dernière fonctionnalité n'est à faire qu'une fois, sinon il y aura des doublons dans la base).
<br>
<br>
Si vous avez besoin de remettre en état votre base, il suffira de retourner dans psql depuis une fenêtre de terminal positionnée sur le répertoire SQL.
Lorsque vous êtes connecté à la base boboniortdb, exécuter le script BoBoTab-DROP.sql puis BoBoniort-full-demo.sql. Et enfin après avoir fermé psql, exécuter runvil.
<br>


