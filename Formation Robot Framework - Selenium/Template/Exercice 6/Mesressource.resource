*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 6 Ajout ou Suppr/" -i "exercice 6 ajout ou suppr" Tests
...             Keywords String : https://robotframework.org/robotframework/latest/libraries/String.html
...             Doc DataDriver : https://github.com/Snooz82/robotframework-datadriver
Library         String
Library         DataDriver      file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=unix
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Variables       ../../Ressources/locators.py

*** Keywords ***
Login
    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   Firefox
    ...                       remote_url=http://firefox:4444
    Maximize Browser Window
    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin123
    Click Element   ${LoginButton}
    Element Text Should Be    ${TitleDashboard}  Dashboard
# LES AUTRES KEYWORDS SONT MAINTENANT DANS DES FICHIERS RESSOURCES DEDIES

Création d'un poste
    [Arguments]     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Go to    https://opensource-demo.orangehrmlive.com/web/index.php/admin/saveJobTitle

    Input Text    ${JobTitleInput}    ${Job_title}
    Input Text  ${JobDescriptionInput}  ${Job_description}

    Choose File  ${JobSpecificationInput}   ${Job_file}

    Input Text  ${NoteInput}  ${Job_note}

    Click Element  ${SaveButton}

    Element Text Should Be   ${SuccessMessage}  Successfully Saved

    Sleep  4s

Supréssion d'un poste 
    [Arguments]     ${Job_title}
    Go to    https://opensource-demo.orangehrmlive.com/web/index.php/admin/viewJobTitleList

    Click element    ${DynamicJobTitle.format('${Job_title}')}

    Click Element     ${DeleteSelectedButton}

    Click Element     ${YesDeleteButton}

    Element Text Should Be   ${SuccessMessage}  Successfully Deleted

    Sleep  4s