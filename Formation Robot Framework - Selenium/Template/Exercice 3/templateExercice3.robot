############
# SETTINGS #
############
# Importer la librairie Selenium
# Ajouter les options suivantes lors de l'import de la librairie
# implicit_wait=0:00:30    timeout=0:00:30

# Importer la librairie     String
# Importer la librairie     DateTime

# Charger le fichier locator.py
# Variables       ../../Ressources/locators.py


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
# [Tags]  exercice 3

# Ligne de commande pour éxécuter le Test Case :
# robot -d "Resultats/Exercice 3/" -i "exercice 3" Tests

# Objectifs :
        # Ouvrir le navigateur et aller sur la bonne URL (voir VARIABLES>URL)
        # Se connecter et atteindre la page d'accueil (exercice 1A)
        # Accéder à la page My Info
        # Récupérer le nom et prénom de l'employé
        # Modifier son nom et prénom
        # Récupérer la date du jour à l’aide de la méthode Get Current Date au format AAAA-MM-JJ
        # Renseigner la valeur dans le champ License Expiry Date avec la méthode Input Text (Effacer au préalable le champ avec Press Keys)
        # Vérifier le message de confirmation lorsqu’on fait la sauvegarde
        # Indiquer si la sauvegarde s'est bien passée ou non (Success)

# Objectif Bonus :
        # Récupérer le jour de naissance en cliquant sur le champ « Date of birth » et ainsi en ouvrant le calendrier
        # Le jour sélectionné dans le calendrier (surligné) a une classe dont l’attribut est –selected


# Keywords utiles (voir le fonctionnement dans la doc associée) :
#       Get Current Date
#       Should Be Equal As Strings
#       Press Keys

# Utiliser les locators suivants (ou utiliser le fichier locator.py) :
#        Accès Menu XXX              : xpath://li[@class='oxd-main-menu-item-wrapper']//child::span[text()='XXX']
#        Bouton Save                 : xpath:(//button[@type="submit" and contains(., "Save")])[1]
#        Champ Date Naissance        : xpath://*[text()='Date of Birth']//following::*[@class='oxd-date-input']/input
#        Calendrier Date Naissance   : xpath://*[@class='oxd-date-input-calendar']
#        Jour Selectionne Calendrier : xpath://div[@class='oxd-calendar-date --selected']
#        Champ Date Permis           : xpath://*[text()='License Expiry Date']//following::*[@class='oxd-date-input']/input
#        Fermer Calendrier           : xpath://div[@class='oxd-date-input-link --close']"
#        Boite Message Sauvegarde    : id:oxd-toaster_1
#        Titre Boite Message         : xpath://*[contains(@class,'oxd-text--toast-title')]
#        Message Boite Message       : xpath://*[contains(@class,'oxd-text--toast-message')]

# Documentation :
#        https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#        https://robotframework.org/robotframework/latest/libraries/String.html
#        https://robotframework.org/robotframework/latest/libraries/DateTime.html
#        https://guykisel.github.io/robotframework-faker/
#        https://docs.python.org/3/library/datetime.html#strftime-strptime-behavior


############
# KEYWORDS #
############
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par vos Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action


########################################
# FONCTIONNEMENT DU FICHIER LOCATOR.PY #
########################################

Il est possible de charger le fichier locator.py dans les *** Settings ***
Cela créera automatiquement un ensemble de variables pouvant être utilisées dans le Test Case et les Keywords

Exemple :
    Input Text    ${UsernameInputBox}    Admin


##############################
# FONCTIONNEMENT DE EVALUATE #
##############################

Le Keyword EVALUATE permet d'exécuter directement du code Python passer par un mot clé de RF
Exemple :
    ${period}=    Evaluate    'Jour de naissance en 1ère partie de mois' if ${day}<=15 else 'Jour de naissance en 2nde partie de mois'

Le code exécuté est un "if else" écrit sur une ligne à la façon de Python
Notez qu'il est malgré tout possible d'inclure des variables RF dans ce code (${day})


######################################################
# FONCTIONNEMENT DE ${my_var.format('${parametre}')} #
######################################################

Si my_var est une String alors il est directement possible d'appeler les méthodes String de Python dessus
Cela simplifie l'écriture du code RF
Exemple : ${my_var.replace('a', 'b')}
https://www.w3schools.com/python/python_ref_string.asp

La variable ${parametre} est une nested variable (une variable à l'intérieure d'une autre variable)
Cela permet de dynamiser les variables
Exemple : Click Element    ${DynamicMenu.format('${MENU}')}

Ici nous combinons les deux usages :
1) appel de la méthode String.format() qui remplace les placeholders dans la chaîne de caractères (par défaut les {})
2) passage en paramètre du nom du menu via ${MENU}

Click Element   xpath://li[@class='oxd-main-menu-item-wrapper']//child::span[text()='']


DynamicMenu = "xpath://li[@class='oxd-main-menu-item-wrapper']//child::span[text()='My Info']"

${MENU}    PIM
Click Element    ${DynamicMenu.format('${MENU}')}
