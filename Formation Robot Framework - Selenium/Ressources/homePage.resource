*** Settings ***
Documentation   All the keywords of Home page
Library         SeleniumLibrary
Variables       locators.py

*** Keywords ***
il ouvre le menu
    [Arguments]      ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}


