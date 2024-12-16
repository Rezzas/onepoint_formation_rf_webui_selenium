############
# SETTINGS #
############
# Importer la librairie Selenium
# Ajouter les options suivantes lors de l'import de la librairie
# implicit_wait=0:00:30    timeout=0:00:30

# Importer la librairie     String

# Importer la librairie     DateTime

# Importer la librairie     FakerLibrary

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
# [Tags]  exercice 4

# Ligne de commande pour éxécuter le Test Case :
# robot -d "Resultats/Exercice 4/" -i "exercice 4" Tests

# Objectifs :
#       Reprendre l'exercice 3 et l'écrire à la façon Gherkin
#       Si ce n'est pas déjà fait, inclure le bonus
#       Bonus : Ajouter entre 1 et 100 jours aléatoirement à la date d’expiration du permis (utilisation de la librairie FakerLibrary)

# Documentation :
        https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#behavior-driven-style


############
# KEYWORDS #
############
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par vos Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action


#####################################
# FONCTIONNEMENT DE GIVEN WHEN THEN #
#####################################

Il est possible d'écrire un Test Case en utilisant le formalisme Given When Then
Les Keywords appelés avec ces préfixes peuvent ou non mentionner ce formalisme

TC
Valid Login
    Given login page is open
    When valid username and password are inserted
    and credentials are submitted
    Then welcome page should be open

Keyword
    Given login page is open
    ou
    Login page is open

######################################
# FONCTIONNEMENET DE LIBRARY.KEYWORD #
######################################

Si un Keyword est présent dans plusieurs librairies
Il est possible de spécifier quelle librairie appelle le Keyword via Library.Keyword
Afin d'être sûr que le Keyword appelé est celui souhaité
Exemple : FakerLibrary.Random Int

Cela s'applique aussi à nos propres librairies et autres fichiers .resource