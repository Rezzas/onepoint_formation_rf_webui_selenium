*** Settings ***
Library         SeleniumLibrary    implicit_wait=0:00:10    timeout=0:00:10
Library         String
Variables       ../../Ressources/locators.py
Suite Setup     Set Selenium Speed  1s


*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      Chrome

*** Test Cases ***
Login Error
    [Tags]  exercice 1B
    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Title Should Be    OrangeHRM
    Input Text    ${UsernameInputBox}    Admin
    Input Text    ${PasswordInputBox}    oulalala
    Click Element    ${LoginButton}
    Element Text Should Be    ${LoginErrorMessage}    Invalid credentials

    Sleep   2s
    Close Browser
