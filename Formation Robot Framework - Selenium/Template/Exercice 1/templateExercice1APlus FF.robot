*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 1A/" -i "exercice 1A" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Force Tags      template exercice 1A
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

*** Variables ***
# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords

# Exemple :
${MA_VARIABLE}      AAAA
${URL}              https://aaaa.com
${BROWSER}          Firefox


*** Test Cases ***
Mon Test Case Exercice 1A

    # Objectifs :
        # Ouvrir le navigateur et aller sur la bonne URL (voir VARIABLES>URL)
        # Renseigner le champ username avec la valeur : Admin
        # Renseigner le champ password avec la valeur : admin123
        # Cliquer sur le bouton de connexion
        # Vérifier la présence de l'élément Dashboard qui prouve la bonne connexion

    # Utilisation d'une variable du fichier locator.py :
    Log To Console    ${UsernameInputBox}
        
    # Keywords utiles :
    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   ${BROWSER}
    ...                       remote_url=http://firefox:4444

    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin12
    Click Element   ${LoginButton}
    Element Text Should Be    ${TitleDashboard}  Dashboard
