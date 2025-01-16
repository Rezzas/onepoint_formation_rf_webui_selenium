*** Settings ***
Force Tags      exercice 5

Library         SeleniumLibrary    implicit_wait=0:00:05    timeout=0:00:10
Library         DataDriver      file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=unix
Variables       ../../Ressources/locators.py

Library    OperatingSystem
Library    Collections
Library    String
Suite Setup     Set Selenium Speed  0.5s
Test Teardown   Close Browser

# Test Template permet de jouer un cas de test avec de multiples datasets
Test Template   KeyWord Chapeau ou le Point d'entrée

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           Chrome

*** Test Cases ***
Ajouter un job title : ${Job_title} ${Job_description} ${Job_file} ${Job_note}

*** Keywords ***
KeyWord Chapeau ou le Point d'entrée
    [Arguments]     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Given un utilisateur se connectant sur la page d'accueil
    And il ouvre le menu    Admin
    And il ouvre l'onglet   Job
    When il ajoute un job title     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Then un message de confirmation apparaît
    Sleep    2s

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

il ouvre l'onglet
    [Arguments]     ${tab}
    Click Element   ${DynamicTab.format('${tab}')}
    Click Element   ${FirstTab}
    Wait Until Page Contains Element    ${JobTitlesHeader}

il ajoute un job title
    [Arguments]    ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Click Button    ${AddButton}
    Wait Until Page Contains Element    ${AddJobTitleLabel}
    Input Text    ${JobTitleInput}    ${Job_title}
    Run Keyword If           '${Job_description}'!='${EMPTY}'
    ...    Input Text    ${JobDescriptionInput}    ${Job_description}
    Run Keyword If    r'${Job_file}'!='${EMPTY}'
    ...    Choose File    ${JobSpecificationInput}    ${Job_file}
    Run Keyword If    '${Job_note}'!='${EMPTY}'
    ...    Input Text    ${NoteInput}    ${Job_note}
    Click Element    ${SaveButton}

un message de confirmation apparaît
    Set Selenium Speed  0s
    Wait Until Element Is Visible    ${MessageContainer}    error=Message de confirmation pas affiché
    ${title}=   Get Text    ${TitleSuccessMessage}
    ${message}=   Get Text    ${SuccessMessage}
    Should Be Equal As Strings    ${title}    Success   msg=Titre du message de confirmation incorrect
    Should Be Equal As Strings    ${message}    Successfully Saved     msg=Message de confirmation incorrect
