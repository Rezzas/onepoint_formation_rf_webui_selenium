*** Settings ***
Documentation   Sauce Labs Demo
Library         SeleniumLibrary
Library         Collections
Library         ../Librairies/SauceLabs.py

*** Variables ***
&{payload}
#${BROWSER_VERSION}  108.0
#${PLATFORM_NAME}    Windows 11
@{CHROME_OPTIONS}    --disable-infobars    --start-maximized
@{FIREFOX_OPTIONS}   --width=2560           --height=900

${REMOTE_URL} =     http://SAUCE-USER-NAME:SAUCE-KEY@ondemand.eu-central-1.saucelabs.com:443/wd/hub
# Remplacer SAUCE-USER-NAME par son username SauceLabs et SAUCE-KEY par sa KEY (Ouvrir la page User Settings dans SauceLabs pour avoir ces 2 valeurs de paramètres)

# DESIRED_CAPABILITIES
${DESIRED_CAPABILITIES}   platform:Windows 11,browserName:chrome,version:latest
#${DESIRED_CAPABILITIES}   platform:Linux,browserName:chrome,version:108.0

*** Keywords ***
remoteChrome
    [Documentation]    Launch Chrome browser on SauceLabs
    [Arguments]     ${URL}
    # Etape 1: Ouverture du browser avec les capabilities
    ${CHROME_OPTIONS}=  Set Chrome Options
    Open Browser    ${URL}  Chrome  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}  options=${CHROME_OPTIONS}
    # Open Browser    ${URL}  Chrome  remote_url=${REMOTE_URL}  options=browser_version('${BROWSER_VERSION}');platform_name('${PLATFORM_NAME}');add_argument("--start-maximized");add_argument("--disable-infobars")
    Update Test Name

remoteFirefox
    [Documentation]    Launch Firefox browser on SauceLabs
    [Arguments]     ${URL}
    # Etape 1: Ouverture du browser avec les capabilities
    Open Browser    ${URL}  Firefox  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}  options=${CHROME_OPTIONS}
    #Open Browser    ${URL}  Firefox  remote_url=${REMOTE_URL}  options=browser_version('${BROWSER_VERSION}');platform_name('${PLATFORM_NAME}');add_argument("--width=2560");add_argument("--height=900")
    Update Test Name

Update Test Name
    [Documentation]    Update du nom du cas de test
    Set Global Variable   ${job_name}    ${SUITE_NAME} : ${TEST_NAME}
    Run Keyword If    '${REMOTE_URL}' != ''
    ...  Set To Dictionary   ${payload}    name=${SUITE NAME.rsplit('.')[-1]}: ${TEST_NAME}

Set Chrome Options
    [Documentation]    Set Chrome options
    ${OPTIONS}=    Evaluate    selenium.webdriver.ChromeOptions()
    # Chargement des options Chrome
    FOR    ${OPTION}    IN    @{CHROME_OPTIONS}
        Call Method    ${OPTIONS}    add_argument    ${OPTION}
    END

Set Firefox Options
    [Documentation]    Set Firefox options
    ${OPTIONS}=    Evaluate    selenium.webdriver.FirefoxOptions()
    # Chargement des options Firefox
    FOR    ${OPTION}    IN    @{FIREFOX_OPTIONS}
        Call Method    ${OPTIONS}    add_argument    ${OPTION}
    END

End Session
    [Documentation]    Update du status sur SauceLabs
    Run Keyword If  '${TEST_STATUS}' == 'PASS'
    ...     Set To Dictionary   ${payload}    passed=${True}
    ...     ELSE   Set To Dictionary   ${payload}    passed=${False}
    Update Test    ${payload}   ${REMOTE_URL}   ${job_name}

    # Fermeture du browser
    Close Browser
