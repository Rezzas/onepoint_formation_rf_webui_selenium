*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 4/" -i "exercice 4" Tests
...             Keywords String : https://robotframework.org/robotframework/latest/libraries/String.html
...             Keywords DateTime : https://robotframework.org/robotframework/latest/libraries/DateTime.html
...             Examples FakerLibrary : https://github.com/laurentbristiel/robotframework-faker-example/blob/master/faker-example.robot
Force Tags      template exercice 4
Library         String
Library         DateTime
Library         FakerLibrary
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  0.5s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

*** Variables ***
# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords

# Exemple :
${MA_VARIABLE}   AAAA
${URL}   https://aaaa.com
${BROWSER}    Chrome

*** Test Cases ***
# Renommer clairement le Test Case, exemple : Verifier Menus Volet Gauche
Mon Test Case Exercice 4

    # Objectifs :
        # Reprendre l'exercice 3 et l'écrire à la façon Gherkin
        # Si ce n'est pas déjà fait, inclure le bonus
        # Bonus : Ajouter entre 1 et 100 jours aléatoirement à la date d’expiration du permis (utilisation de la librairie FakerLibrary)

    # Documentation Given / When / Then:
        # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#behavior-driven-style

    # Appel de nos propres Keywords
    Reutiliser Mon Test Case De Connexion De L'Exercice 1A Et En Faire Un Keyword
    Declarer Un Autre Keyword Utile Pour Découper Logiquement Mon Test

    # Keywords utiles :
    ${random}    FakerLibrary.Random Int    min=0    max=100   step=1

    #Synthase Gherkin, attention pas de double espace entre Given/When/And/Then et les keywords
    Given keyword_1
    When keyword_2
    And keyword_3
    Then keyword_4

*** Keywords ***
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par votre Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action

# Réutiliser l'exercice 1A pour vous connecter à la page d'accueil
Reutiliser Mon Test Case De Connexion De L'Exercice 1A Et En Faire Un Keyword
    Open Browser    ${URL}    ${BROWSER}
    # etc.

Declarer Un Autre Keyword Utile Pour Découper Logiquement Mon Test

 # Astuce : il est possible d'accéder aux méthodes et aux attributs d'un objet directement depuis l'appel de la variable
    # Exemple : la classe WebElement a pour attribut text, il est donc possible de faire ${string.format()}

    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-syntax
    # https://docs.python.org/fr/3/library/stdtypes.html#str.format

Acces Menu
    [Arguments]    ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}

 keyword_1
 keyword_2
 keyword_3
 keyword_4
