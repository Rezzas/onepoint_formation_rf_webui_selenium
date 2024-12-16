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
${BROWSER}          Chrome


*** Test Cases ***
# Renommer clairement le Test Case, exemple : Login Page Accueil
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
    Open Browser    variable_url    variable_browser
    Title Should Be    titre_de_la_page
    Element Should Be Visible    variable_locator.py
    Input Text     variable_locator.py    texte
    Click Element    variable_locator.py
#   Click Button (attention, ce keyword ne fonctionne pas si le bouton n'est pas un <button> dans le code HTML)
    Element Text Should Be    variable_locator.py    texte
