*** Settings ***
Force Tags      exercice 6
Library         DataDriver      file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=excel
Resource        ../../Ressources/authenticationPage.resource
Resource        ../../Ressources/homePage.resource
Resource        ../../Ressources/jobTitlesPage.resource
Suite Setup     Set Selenium Speed  0.25s
Test Teardown   Close Browser

# Test Template permet de jouer un cas de test avec de multiples datasets
Test Template   Verifier Ajout job titles

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           Chrome

*** Test Cases ***
Ajouter un job title : ${Job_title} ${Job_description} ${Job_file} ${Job_note}

*** Keywords ***
Verifier Ajout job titles
    [Arguments]     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Given un utilisateur se connectant sur la page d'accueil     ${URL}    ${BROWSER}
    And il ouvre le menu    Admin
    And il ouvre l'onglet   Job
    When il ajoute un job title     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Then un message de confirmation apparaît    Successfully Saved
    Sleep    2s
