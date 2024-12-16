############
# SETTINGS #
############
# Importer la librairie Selenium
# Ajouter les options suivantes lors de l'import de la librairie
# implicit_wait=0:00:30    timeout=0:00:30

# Importer la librairie     String

# Importer la librairie     DataDriver
# Ajouter les options suivantes lors de l'import de la librairie
# file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=unix

# Charger le fichier locator.py
# Variables       ../../Ressources/locators.py

# Définir le Test Template qui sera utilisé
# Exemple : Test Template    MonKeywordAExecuterPlusieursFoisEnFaisantVarierLesDonnees

# Inclure les fichiers .resource que vous créez en respectant les principes du POM
# Exemple : Resource        ../../Ressources/homePage.resource


#############
# VARIABLES #
#############
# Si nécessaire déclarer des variables ici,
# Sinon vous pouvez tout mettre dans le Test Case directement
# Exemple :
#${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords
# Cela permet de faire transiter efficacement de l'information sans avoir à utiliser de RETURN


##############
# TEST CASES #
##############
# Ajouter le tag :
# [Tags]  exercice 6

# Ligne de commande pour éxécuter le Test Case :
# robot -d "Resultats/Exercice 6/" -i "exercice 6" Tests

# Objectifs :
#       Reprendre l'exercice 5 et l'écrire en respectant les principes du POM
#       Séparer les différents Keywords dans des fichiers .resource que vous importerez dans la section Settings
#       Attention, le découpage doit avoir un sens fonctionnel, même minimal
#       Exercice bonus : plutôt que d'ajouter les job titles, supprimer les

# Documentation :
        https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#behavior-driven-style
        https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-templates
        https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#resource-files


############
# KEYWORDS #
############
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par vos Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action


##########################################
# FONCTIONNEMENT DES FICHIERS RESSOURCES #
##########################################

Les fichiers .resource sont des fichiers ne contenant pas de Test Case
En revanche, ils contiennent les mêmes autres Section que les fichiers .robot classiques
Leur but est d'organiser notre code plus efficacement

Certains Keyword (comme le login) sont utilisés par l'ensemble des Test Cases
Il est donc intéressant de les mettre dans un endroit unique afin de les maintenir plus facilement
Et de permettre une meilleure lisibilité du code