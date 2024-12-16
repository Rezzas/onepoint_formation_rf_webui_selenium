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
# [Tags]  exercice 5

# Ligne de commande pour éxécuter le Test Case :
# robot -d "Resultats/Exercice 5/" -i "exercice 5" Tests

# Objectifs :
#       Utiliser le fichier fourni en entrée contenant 2 JDD : data.csv et les 2 fichiers png fournis
        pour faire un upload de fichier dans le champ « Job Specification » (utiliser la méthode Choose File)
#       Bien penser à mettre le test case « Verifier Ajout job titles » dans la rubrique Keywords
#       Ecrire le test case en Gherkin
#       Les champs « Job Description », « Job Specification » et « Note » étant des champs facultatifs, vérifier que la valeur de ces champs n’est pas vide dans le fichier avant de les renseigner (utiliser la méthode Run Keyword If)
#       Vérifier le message de confirmation lors de l’ajout
#       Les job titles ajoutés sont uniques et doivent être supprimés avant de pouvoir être de nouveau ajoutés

# Keywords utiles (voir le fonctionnement dans la doc associée) :
#       Choose File
#       Run Keyword If

# Documentation :
        https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#behavior-driven-style
        https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-templates


############
# KEYWORDS #
############
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par vos Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action


#######################################
# FONCTIONNEMENT DU DATA DRIVEN STYLE #
#######################################

Pour transformer un fichier .robot en Data Driven Style (piloté par les données)
Il faut inclure dans le Settings : Test Template   NomDeMonKeywordQuiSertDeTemplate

Le Keyword NomDeMonKeywordQuiSertDeTemplate sera le point d'entrée par défaut des Test Case
Les Test Cases ne définissent alors plus que des jeux de données
qui seront transmis via des arguments au Keyword NomDeMonKeywordQuiSertDeTemplate

Si le template est déclaré dans la section *** Settings ***
Alors il s'applique par défaut à l'ensemble des Test Cases


################################
# FONCTIONNEMENT DE DATADRIVER #
################################

DataDriver est une librairie qui permet de charger un jeu de données EXTERNE lors de l'exécution d'un fichier .robot
Dit autrement : DataDriver pousse la notion de Template (Data Driven style) un cran plus loin via l'externalisation des jeux de données

Les JDD étant externes, il faut réécrire la partie Test Case afin que DataDriver sache se pluguer à RobotFramework

###
# Sans DataDriver (les données sont DANS le TC) :
###

TC
Templated test case
    first arg 1     first arg 2
    second arg 1    second arg 2
    third arg 1     third arg 2
    Toto            Titi
    Tata            Tutu


###
# Avec DataDriver (les données sont EN DEHORS du TC) :
###

Test Case
Templated test case :  ${arg1} ${arg2}

Fichier .csv (les données sont ici)
# *** Test Cases ***,${arg1},${arg2}
first arg 1,first arg 2
second arg 1,second arg 2
third arg 1,third arg 2
Toto,Titi
Tata,Tutu
