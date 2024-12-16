*** Settings ***
Library         SeleniumLibrary    implicit_wait=0:00:10    timeout=0:00:10
Library         Collections
Variables       ../../Ressources/locators.py
Suite Setup     Set Selenium Speed  1s
Suite Teardown  Close Browser

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           Chrome
@{MENUS_ATTENDUS_TEXTE}    Admin    PIM    Leave    Time   Recruitment   My Info    Performance    Dashboard   Directory    Maintenance   Claim    Buzz
@{MENUS_RECUPERES_TEXTE}

*** Test Cases ***
Verifier Menus Volet Gauche
    [Tags]  exercice 2
    Ouvrir OrangeHRM
    Login Page Accueil
    Recuperer Texte Menus Volet Gauche
    Logger Debug    ${MENUS_RECUPERES_TEXTE}    ${MENUS_ATTENDUS_TEXTE}

    # JE COMPARE MA LISTE DES ATTENDUS ET CELLE DES TEXTES OBTENUS
    Lists Should Be Equal    ${MENUS_RECUPERES_TEXTE}    ${MENUS_ATTENDUS_TEXTE}    msg=ERREUR LISTE DIFFERENTE    values=True    names=None    ignore_order=True
    Sleep    5s

*** Keywords ***
Ouvrir OrangeHRM
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Title Should Be    OrangeHRM

Login Page Accueil
    Input Text    ${UsernameInputBox}    Admin
    Input Text    ${PasswordInputBox}    admin123
    Click Element    ${LoginButton}

Recuperer Texte Menus Volet Gauche

    # JE RETROUVE LES WEB ELEMENTS QUI M'INTERESSENT
    # INTERESSENT = ${MenusText}
    # ${MenusText} = //li[@class='oxd-main-menu-item-wrapper']//child::span
    ${MENUS_RECUPERES_WEB_ELEMENT}=    Get WebElements     ${MenusText}

    # POUR CHAQUE WEB ELEMENT
    FOR    ${menu_web_element}    IN    @{MENUS_RECUPERES_WEB_ELEMENT}
        # JE RECUPERE SON TEXTE
        ${texte}=    Get Text    ${menu_web_element}
        # JE LE METS DANS UNE LISTE
        Append To List    ${MENUS_RECUPERES_TEXTE}    ${texte}
    END

Logger Debug
    [Arguments]    ${NOM_MENUS_RECUPERES}     ${NOM_MENUS_ATTENDUS}
    Log To Console    -
    Log To Console    \t > Nom du menu recupere / attendu :
    # Itération sur 2 listes en même temps :
    FOR    ${menu_recupere}    ${menu_attendu}    IN ZIP   ${NOM_MENUS_RECUPERES}    ${NOM_MENUS_ATTENDUS}
        Log To Console    \t > ${menu_recupere} \t\t / ${menu_attendu}
    END
    Log To Console     -
