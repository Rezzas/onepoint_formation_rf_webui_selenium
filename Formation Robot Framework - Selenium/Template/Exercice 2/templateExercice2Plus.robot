*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 2/" -i "exercice 2" Tests
...             Keywords Collections : https://robotframework.org/robotframework/latest/libraries/Collections.html
Force Tags      template exercice 2
Library         Collections
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  1s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

*** Variables ***
@{MA_LISTE_DES_ATTENDUS}    Admin  PIM  Leave  Time  Recruitment  My Info  Performance  Dashboard  Directory  Maintenance  Claim  Buzz
@{MA_LISTE_DES_TEXTES_RECUPERES}

*** Test Cases ***
Mon Test Case Exercice 2
    login
    verif menu gauche

*** Keywords ***
login
    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   Chrome
    ...                       options=add_experimental_option("excludeSwitches", ["enable-logging"])
    ...                       remote_url=http://chrome:4444

    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin123
    Click Element   ${LoginButton}
    Element Text Should Be    ${TitleDashboard}  Dashboard

verif menu gauche
     ${ELEMENTS_RECUPERES}=    Get WebElements    ${MenusText}  

     FOR  ${element}  IN  @{ELEMENTS_RECUPERES}
       Log To Console  ${element}
       ${TEXTE_RECUPERE}=    Get Text    ${element}
        Log To Console  ${TEXTE_RECUPERE}
        Append To List   ${MA_LISTE_DES_TEXTES_RECUPERES}    ${TEXTE_RECUPERE}
    END
    Lists Should Be Equal    ${MA_LISTE_DES_TEXTES_RECUPERES}    ${MA_LISTE_DES_ATTENDUS}    msg=ERREUR LISTE DIFFERENTE    values=True    names=None    ignore_order=True
