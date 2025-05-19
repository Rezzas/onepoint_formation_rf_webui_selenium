*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 1B/" -i "exercice 1B" Tests
...             Keywords SeleniumLibrary : https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
Force Tags      template exercice 1B
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
# Renommer clairement le Test Case, exemple : Login Cas Non Passant
Mon Test Case Exercice 1B


    # Objectifs :
        # Ouvrir le navigateur et aller sur la bonne URL (voir VARIABLES>URL)
        # Renseigner le champ username et/ou le champ password avec une valeur erronée (autre que Admin/admin123)
        # Cliquer sur le bouton de connexion
        # Vérifier la présence du message d'erreur qui prouve la non connexion

    # Utilisation d'une variable du fichier locator.py :
    Log To Console    ${UsernameInputBox}

    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   ${BROWSER}
    ...                       remote_url=http://firefox:4444

    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin12
    Click Element   ${LoginButton}
    Element Text Should Be    ${LoginErrorMessage}  Invalid credentials

#     # Keywords utiles :
#     Open Browser    variable_url    variable_browser
#     Title Should Be    titre_de_la_page
#     Element Should Be Visible    variable_locator.py
#     Input Text     variable_locator.py    texte
#     Click Element    variable_locator.py
# #   Click Button (attention, ce keyword ne fonctionne pas si le bouton n'est pas un <button> dans le code HTML)
#     Element Text Should Be    variable_locator.py    texte
#     Sleep    nombre_de_secondes
