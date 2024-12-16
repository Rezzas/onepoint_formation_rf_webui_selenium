*** Settings ***
Library         SeleniumLibrary    implicit_wait=0:00:10    timeout=0:00:10
Library         String
Library         DateTime
Variables       ../../Ressources/locators.py
Suite Setup     Set Selenium Speed  0.5s
Test Teardown   Close Browser

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           Chrome
${PRENOM_ATTENDU}    Paul
${NOM_ATTENDU}       Collings
${Menu}              My Info
${PRENOM_RECUPERE}
${NOM_RECUPERE}

*** Test Cases ***
Verifier Modification Utilisateur
    [Tags]  exercice 3

    Login Page Accueil
    Acces Menu    My Info
    Recuperer Prenom Nom Employe
    Modifier Prenom Nom Employe
    Renseigner Date Permis
    # Bonus :
    # Recuperer Jour Naissance
    Sauvegarder Info
    Verification sauvegarde
    Sleep    2s
    Close Browser

*** Keywords ***
Login Page Accueil
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Input Text    ${UsernameInputBox}    Admin
    Input Text    ${PasswordInputBox}    admin123
    Click Element    ${LoginButton}

Acces Menu
    [Arguments]    ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}

Recuperer Prenom Nom Employe
    # Temps d'attente obligatoire
    Sleep    1s
    ${PRENOM_NOM}=    Get Text    ${EmployeeName}
    ${PRENOM}    ${NOM}=    Split String    ${PRENOM_NOM}    max_split=1
    [RETURN]    ${PRENOM}    ${NOM}

Modifier Prenom Nom Employe
    #[Arguments]     ${PRENOM_RECUPERE}      ${NOM_RECUPERE}
    IF    "${PRENOM_RECUPERE}" != "${PRENOM_ATTENDU}"
        Press Keys    ${EmployeeFirstName}        CTRL+a+BACKSPACE
        Input Text    ${EmployeeFirstName}        ${PRENOM_ATTENDU}
    END

    IF    "${NOM_RECUPERE}" != "${NOM_ATTENDU}"
        Press Keys    ${EmployeeLastName}     CTRL+a+BACKSPACE
        Input Text    ${EmployeeLastName}     ${NOM_ATTENDU}
    END

Renseigner Date Permis
    ${today}=    Get Current Date   result_format=%Y-%d-%m
    Log To Console    date: ${today}
    Press Keys  ${LicenseExpiryDate}      CTRL+a+BACKSPACE
    Input Text  ${LicenseExpiryDate}    ${today}
    Click Element    ${CloseCalendarLink}

Sauvegarder Info
    Click Element    ${MyInfoSaveButton}

Verification sauvegarde
    Wait Until Element Is Visible    ${MessageContainer}
    ${title}=   Get Text    ${TitleSuccessMessage}
    ${message}=   Get Text    ${SuccessMessage}
    Should Be Equal As Strings    ${title}    Success
    Should Be Equal As Strings    ${message}    Successfully Updated

# Bonus : Récupérer le jour de naissance à partir du champ Date of Birth puis indiquer si le jour de naissance se situe en 1ère partie de mois (<= au 15 du mois) ou en 2nde partie de mois (> au 15 du mois)
#Recuperer Jour Naissance
#    Wait Until Element Is Visible    ${MyInfoSaveButton}
#    Click Element    ${DateOfBirthInputBox}
#    Wait Until Element Is Visible    ${DateOfBirthCalendar}
#    ${day}=     Get Text    ${SelectedDay}
#    Log To Console    jour de naissance: ${day}
#    ${period}=    Evaluate    'Jour de naissance en 1ère partie de mois' if ${day}<=15 else 'Jour de naissance en 2nde partie de mois'
#    Log To Console    ${period}

    

