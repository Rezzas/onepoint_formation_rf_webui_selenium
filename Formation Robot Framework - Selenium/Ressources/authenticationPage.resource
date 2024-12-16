*** Settings ***
Documentation   All the keywords of Authentication page
Library         SeleniumLibrary
Resource        common.resource
Variables       locators.py

*** Variables ***
${URL}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}           Firefox

*** Keywords ***
un utilisateur se connectant sur la page d'accueil
    [Arguments]     ${URL}    ${BROWSER}
    Run Keyword If  '${BROWSER}' =='rChrome'  common.remoteChrome    ${URL}
    ...     ELSE IF    '${BROWSER}' =='rFirefox'  common.remoteFirefox    ${URL}
    ...     ELSE    Open Browser    ${URL}    ${BROWSER}    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Title Should Be    OrangeHRM
    Input Text    ${UsernameInputBox}    Admin
    Input Text    ${PasswordInputBox}    admin123
    Click Element    ${LoginButton}




