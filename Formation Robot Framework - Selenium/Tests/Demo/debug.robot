*** Settings ***
Library         SeleniumLibrary    implicit_wait=0:00:10    timeout=0:00:10
Library         Collections
Variables       ../../Ressources/locators.py
Suite Setup     Set Selenium Speed  1s
Suite Teardown  Close Browser

*** Variables ***
@{VARIABLE_SIMPLE}      TOTO    TATA
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      Chrome

*** Test Cases ***
Pour mieux comprendre
    [Tags]  comprendre

    Login Page Accueil    Admin    admin123
    Acces Menu    Admin
    Sleep    5s


*** Keywords ***
Mon Keyword Avec des Parametres
    [Arguments]    ${param1}
    Log To Console    JE SUIS DANS MON KEYWORD AVEC DES PARAMETRES : ${param1}

Login Page Accueil
    [Tags]  exercice 1A
    [Arguments]    ${login}    ${password}
    # Des versions récentes de Chrome peuvent afficher une notification "Chrome is being controlled by automated test software" en haut de l'écran
    # Pour désactiver cette notification, on utilise une ChromeOption appelée excludeSwitches en excluant les notifications
    Open Browser              ${URL}    ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Title Should Be           OrangeHRM
    Input Text                ${UsernameInputBox}                 ${login}
    Input Text                ${PasswordInputBox}                 ${password}
    Click Element             ${LoginButton}
    Element Text Should Be    ${TitleDashboard}                   Dashboard
    Sleep                     2s

Acces Menu
    [Arguments]    ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}


