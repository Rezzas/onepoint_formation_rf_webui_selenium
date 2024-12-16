*** Settings ***
Force Tags       demo
Library          SeleniumLibrary
Suite Setup      Run Keywords
...                 Create Webdriver    Chrome
...                 AND     Set Selenium Speed  1s
Suite Teardown     Close All Browsers

*** Test Cases ***
Test Case 1
    Log To Console  TOTO TITA TOTAALKHLH
    Run Keyword And Continue On Failure    Log To Console TOTO TITA TOTAALKHLH


Test Case 2
    Open the google page

Test Case 3
    Mon Keyword Qui Ne Sert à Rien

*** Keywords ***
Open the login page
    go to   https://www.bstackdemo.com/signin
    Element Text Should Be    id:login-btn    Sign
    # mon comm

Open the google page
    go to   https://google.fr
    Title Should Be    Google

Mon Keyword Qui Ne Sert à Rien
    Log To Console    message
