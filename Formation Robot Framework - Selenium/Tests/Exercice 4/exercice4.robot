*** Settings ***
Library         SeleniumLibrary    implicit_wait=0:00:05    timeout=0:00:05
Library         String
Library         DateTime
Library         FakerLibrary
Variables       ../../Ressources/locators.py
Suite Setup     Set Selenium Speed  0.5s
Test Teardown   Close Browser

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           Chrome
${PRENOM_ATTENDU}     Paul
${NOM_ATTENDU}        Collings

*** Test Cases ***
Verifier Modification Utilisateur
    [Tags]  exercice 4
    Given un utilisateur se connectant sur la page d'accueil
    And il ouvre le menu    My Info
    When il met à jour son nom et prénom
    And il renseigne la date d'expiration de permis
    And il sauvegarde les changements
    Then un message de confirmation apparaît
    Sleep    2s

*** Keywords ***
un utilisateur se connectant sur la page d'accueil
    Open Browser    ${URL}    ${BROWSER}    
    ...    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    ...    remote_url=http://chrome:4444
    
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Input Text    ${UsernameInputBox}    Admin
    Input Text    ${PasswordInputBox}    admin123
    Click Element    ${LoginButton}

il ouvre le menu
    [Arguments]    ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}

il met à jour son nom et prénom
    # Temps d'attente obligatoire
    Sleep    1s
    ${PRENOM_NOM}=    Get Text    ${EmployeeName}
    ${PRENOM_RECUPERE}    ${NOM_RECUPERE}=    Split String    ${PRENOM_NOM}

    IF    "${PRENOM_RECUPERE}" != "${PRENOM_ATTENDU}"
        Press Keys      ${EmployeeFirstName}        CTRL+a+BACKSPACE
        Input Text      ${EmployeeFirstName}        ${PRENOM_ATTENDU}
    END

    IF    "${NOM_RECUPERE}" != "${NOM_ATTENDU}"
        Press Keys      ${EmployeeLastName}       CTRL+a+BACKSPACE
        Input Text      ${EmployeeLastName}       ${NOM_ATTENDU}
    END

il renseigne la date d'expiration de permis
    ${random}    FakerLibrary.Random Int    min=0    max=100   step=1
    Log To Console    nb_jours: ${random}

    ${date}=    Get Current Date   result_format=%Y-%d-%m
    ${date}=    Add Time to Date    ${date}    ${random} days    result_format=%Y-%d-%m
    Log To Console    date: ${date}

    Press Keys  ${LicenseExpiryDate}      CTRL+a+BACKSPACE

    Input Text  ${LicenseExpiryDate}    ${date}

    Click Element    ${CloseCalendarLink}

il sauvegarde les changements
    Click Element    ${MyInfoSaveButton}

un message de confirmation apparaît
    Wait Until Element Is Visible    ${MessageContainer}
    ${title}=   Get Text    ${TitleSuccessMessage}
    ${message}=   Get Text    ${SuccessMessage}
    Should Be Equal As Strings    ${title}    Success
    Should Be Equal As Strings    ${message}    Successfully Updated

