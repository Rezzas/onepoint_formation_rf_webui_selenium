############
# SETTINGS #
############
# Importer la librairie Selenium
# Ajouter les options suivantes lors de l'import de la librairie
# implicit_wait=0:00:30    timeout=0:00:30

# Importer la librairie Collections

# Utiliser Test Setup et Test Teardown pour simplifier le code dans le Test Case
# Exemple : Test Setup    Set Selenium Speed  1s

# Pour appeler plusieurs options dans un Test Setup, vous pouvez créer un Keyword
# Exemple : Test Setup   Jouer Tous Les Test Setups
# Jouer Tous Les Test Setups
#   Set Selenium Speed  1s
#   Open Browser  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  Chrome


#############
# VARIABLES #
#############
# Attention, il ne faut pas utiliser de keyword pour créer de liste dans le module VARIABLES
# Le keyword Create List ne s'utilise qu'au sein d'un Test Case ou d'un autre Keyword
# Afin de déclarer localement une liste temporaire

# Déclarer une liste des attendus :
# @{ma_liste_des_attendus}  item1  item2  item3

# Déclarer une liste vide à alimenter avec les résultats tels qu'ils sont définis sur le site
# @{ma_liste_des_resultats}


##############
# TEST CASES #
##############
# Ajouter le tag :
# [Tags]  exercice 2

# Ligne de commande pour éxécuter le Test Case :
# robot -d "Resultats/Exercice 2/" -i "exercice 2" Tests

# Objectifs :
#       Ouvrir le navigateur et aller sur la bonne URL (voir VARIABLES>URL)
#       Se connecter et atteindre la page d'accueil (exercice 1A)
#       Récupérer les valeurs du volet roulant gauche (Admin, PIM, Leave, Time, Recruitement, ...)
#       Comparer la liste des attendus à la liste des valeurs récupérées

# Objectif Bonus :
#       Afficher dans les logs de la console les noms des menus attendus comparés aux noms des menus récupérés
#       Astuce : voir la boucle FOR IN ZIP

# Keywords utiles (voir le fonctionnement dans la doc associée) :
#       Get WebElements
#       Get Text
#       Log To Console
#       Create List
#       Append To List
#       Lists Should Be Equal

# Utiliser les locators suivants :
#        Champ Password     : name:username
#        Champ Username     : name:password
#        Bouton Log In      : xpath://button[@type='submit']
#        Dashboard          : xpath://span/h6
#        Liste Menu Gauche  : xpath://li[@class='oxd-main-menu-item-wrapper']//child::span

# Documentation :
#        https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#        https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Create%20List
#        https://robotframework.org/robotframework/latest/libraries/Collections.html


############
# KEYWORDS #
############
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par vos Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action


#############################
# FONCTIONNEMENT DES LISTES #
#############################

# Déclarer une liste dans l'espace VARIABLES (pas besoin du Keyword Create List)
# @{ma_liste}  item1  item2  item3

# Déclarer une liste dans un Test Case ou un Keyword (via le Keyword Create List)
# @{ma-liste}=  Create List  item1  item2  item3

# A noter : une liste peut être appelé de deux manières différentes via le @ ou le $
# Appel d'une liste via $ = appel de la liste complète [item1, item2, item3]
# Appel d'une liste via @ = appel de chaque item de la liste un par un : item1 > item2 > item3 (unpack)
# https://www.docstring.fr/glossaire/unpacking/

# Appeler une liste dans Lists Should Be Equal ou Log To Console (utiliser le $)
# Lists Should Be Equal    ${liste1}    ${liste2}
# Log To Console           ${liste}

# Appeler une liste dans une boucle FOR (utiliser le @)
# FOR  ${item}  IN  @{ma_liste}
#       Log To Console  ${item}
# END

#####################################
# FONCTIONNEMENT DE ${element.text} #
#####################################

https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-syntax
https://www.selenium.dev/selenium/docs/api/py/webdriver_remote/selenium.webdriver.remote.webelement.html

Il est possible d'accéder aux méthodes et aux attributs d'un objet directement depuis l'appel de la variable
Exemple : la classe WebElement a pour attribut text, il est donc possible de faire ${element.text}
Cela évite de faire : ${text_elemement}=   Get Text    ${element}

