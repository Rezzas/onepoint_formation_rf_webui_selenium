*** Settings ***
Library         SeleniumLibrary    implicit_wait=0:00:10    timeout=0:00:10
Variables       ../../Ressources/locators.py
Suite Setup     Set Selenium Speed  1s

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      Chrome

*** Test Cases ***
Login Page Accueil
    [Tags]  exercice 1A

    # Des versions récentes de Chrome peuvent afficher une notification "Chrome is being controlled by automated test software" en haut de l'écran
    # Pour désactiver cette notification, on utilise une ChromeOption appelée excludeSwitches en excluant les notifications
    Open Browser              ${URL}    ${BROWSER}
    #...                       options=add_experimental_option("excludeSwitches", ["enable-logging"])
    ...                       remote_url=http://chrome:4444
    Maximize Browser Window
    Title Should Be           OrangeHRM
    Input Text                ${UsernameInputBox}                 Admin
    Input Text                ${PasswordInputBox}                 admin123
    Click Element             ${LoginButton}
    Element Text Should Be    ${TitleDashboard}                   Dashboard
    Sleep                     2s

    Close Browser

