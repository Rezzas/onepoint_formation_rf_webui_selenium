*** Settings ***
Resource  Mesressource.resource
Test Setup      Set Selenium Speed  0.5s
Test Teardown   Close Browser
Test Template   Debut du test

*** Test Cases ***
Mon Test Case Exercice 6

*** Keywords ***
Debut du test
    [Arguments]     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}

    Login
    Création d'un poste    ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Supréssion d'un poste    ${Job_title}
