*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 6 Ajout ou Suppr/" -i "exercice 6 ajout ou suppr" Tests
...             Keywords String : https://robotframework.org/robotframework/latest/libraries/String.html
...             Doc DataDriver : https://github.com/Snooz82/robotframework-datadriver
Force Tags      template exercice 6 ajout ou suppr
Library         String
Library         DataDriver      file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=unix
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Resource        ../../Ressources/authenticationPage.resource
Resource        ../../Ressources/homePage.resource
Resource        ../../Ressources/jobTitlesPage.resource
Test Setup      Set Selenium Speed  0.5s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

# Définir le template :
Test Template   Mon_Keyword_A_Executer_Plusieurs_Fois_En_Faisant_Varier_Les_Donnees


*** Variables ***
# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords

# Exemple :
${MA_VARIABLE}   AAAA
${URL}   https://aaaa.com
${BROWSER}    Chrome


*** Test Cases ***
# Renommer clairement le Test Case, exemple : Verifier Menus Volet Gauche
Mon Test Case Exercice 6

# /!\ ATENTION /!\
#       EN MODE DATA DRIVEN
#       TOUT SE PASSE DANS LA PARTIE KEYWORDS
#       LE TEST CASE NE SERT QUE DE TEMPLATE PAR DEFAUT

    # Objectifs :
        # Reprendre l'exercice 5 et l'écrire en respectant les principes du POM
        # Séparer les différents Keywords dans des fichiers .resource que vous importerez dans la section Settings
        # Attention, le découpage doit avoir un sens fonctionnel, même minimal
        # Exercice bonus : plutôt que d'ajouter les job titles, supprimez les

    # Documentation Resource Files :
        # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#resource-files

*** Keywords ***
Mon_Keyword_A_Executer_Plusieurs_Fois_En_Faisant_Varier_Les_Donnees

# LES AUTRES KEYWORDS SONT MAINTENANT DANS DES FICHIERS RESSOURCES DEDIES
