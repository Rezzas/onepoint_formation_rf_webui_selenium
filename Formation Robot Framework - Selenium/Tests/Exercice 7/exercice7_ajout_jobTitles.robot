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
Test Template   Verifier Ajout job titles

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           rChrome

*** Test Cases ***
Ajouter un job title : ${Job_title} ${Job_description} ${Job_file} ${Job_note}

*** Keywords ***
Verifier Ajout job titles
    [Arguments]     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Given un utilisateur se connectant sur la page d'accueil      ${URL}    ${BROWSER}
    And il ouvre le menu    Admin
    And il ouvre l'onglet   Job
    When il ajoute un job title     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Then un message de confirmation apparaît    Successfully Saved
    Sleep    2s

# Commande à lancer
# robot -v REMOTE_URL:http://SAUCE-USER-NAME:SAUCE-KEY@ondemand.eu-central-1.saucelabs.com:443/wd/hub -d results/Win10Chrome70 -v DESIRED_CAPABILITIES:"name:Win 10 + Chrome 70, platform:Windows 10,browserName:chrome,version:70.0" exercice7_ajout_jobTitles.robot
