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
${BROWSER}    Firefox

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
  

    # Keywords utiles :
    ${random}    FakerLibrary.Random Int    min=0    max=100   step=1

    #Synthase Gherkin, attention pas de double espace entre Given/When/And/Then et les keywords
    Given Un utilisateur qui se connecte à l'application
    When l'utilisateur accède au menu  My Info
    And Modifie le champ prénom
    And Modifie le champ nom
    And Modifie la date du permis
    And Sauvegarde ses modifications
    Then Un message de confirmation s'affiche

*** Keywords ***
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par votre Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action

# Réutiliser l'exercice 1A pour vous connecter à la page d'accueil

Un utilisateur qui se connecte à l'application

    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   ${BROWSER}
    ...                       remote_url=http://firefox:4444
    Maximize Browser Window
    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin123
    Click Element   ${LoginButton}
    Element Text Should Be    ${TitleDashboard}  Dashboard

Modifie le champ prénom
    Press Keys  ${EmployeeFirstName}      CTRL+a+BACKSPACE
    Input Text  ${EmployeeFirstName}    Cyrille

Modifie le champ nom
    Press Keys  ${EmployeeLastName}     CTRL+a+BACKSPACE
    Input Text  ${EmployeeLastName}    Piwo

Sauvegarde ses modifications
    Click Element  ${MyInfoSaveButton}

Modifie la date du permis
    Press Keys  ${LicenseExpiryDate}  CTRL+a+BACKSPACE
    ${today}=    Get Current Date   result_format=%Y-%m-%d
    Input Text  ${LicenseExpiryDate}    ${today}


Un message de confirmation s'affiche 
    Element Text Should Be   ${SuccessMessage}  Successfully Updated


l'utilisateur accède au menu 
    [Arguments]    ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}
