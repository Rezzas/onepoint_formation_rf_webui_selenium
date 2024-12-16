*** Settings ***
Force Tags      exercice 7
Library         SeleniumLibrary    implicit_wait=0:00:05    timeout=0:00:10
Library         DataDriver      file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=excel
Resource        ../../Ressources/authenticationPage.resource
Resource        ../../Ressources/homePage.resource
Resource        ../../Ressources/jobTitlesPage.resource
Suite Setup     Set Selenium Speed  0.25s
Test Teardown   End Session

# Test Template permet de jouer un cas de test avec de multiples datasets
Test Template   Verifier Suppression job titles

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           rChrome

*** Test Cases ***
Supprimer un job title : ${Job_title}

*** Keywords ***
Verifier Suppression job titles
    [Arguments]     ${Job_title}
    Given un utilisateur se connectant sur la page d'accueil     ${URL}    ${BROWSER}
    And il ouvre le menu    Admin
    And il ouvre l'onglet   Job
    When il supprime un job title     ${Job_title}
    Then un message de confirmation apparaît    Successfully Deleted
    Sleep    2s
    