*** Settings ***
Documentation   All the keywords of JobTitlesPage page
Library         SeleniumLibrary
Variables       locators.py

*** Keywords ***
il ouvre l'onglet
    [Arguments]      ${tab}
    Click Element    ${DynamicTab.format('${tab}')}
    Click Element    ${FirstTab}
    Wait Until Page Contains Element    ${JobTitlesHeader}

il ajoute un job title
    [Arguments]    ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}
    Click Button    ${AddButton}
    Wait Until Page Contains Element    ${AddJobTitleLabel}
    Input Text    ${JobTitleInput}    ${Job_title}
    Run Keyword If           '${Job_description}'!='${EMPTY}'
    ...    Input Text    ${JobDescriptionInput}    ${Job_description}
    Run Keyword If    r'${Job_file}'!='${EMPTY}'
    ...    Choose File    ${JobSpecificationInput}    ${Job_file}
    Run Keyword If    '${Job_note}'!='${EMPTY}'
    ...    Input Text    ${NoteInput}    ${Job_note}
    Click Element    ${SaveButton}

il supprime un job title
    [Arguments]     ${Job_title}
    Click Element   ${DynamicJobTitle.format('${Job_title}')}
    # Scroll up to the top :
    Execute JavaScript    window.scrollTo(document.body.scrollHeight,0)
    # -> Voir si on peut optimiser avec les Actions Chains : Move to element et Perform
    Click Button    ${DeleteSelectedButton}
    Click Button    ${YesDeleteButton}

un message de confirmation apparaît
    [Arguments]     ${message_expected}
    Wait Until Element Is Visible    ${TitleSuccessMessage}     error=Message de confirmation pas affiché
    ${title}=   Get Text    ${TitleSuccessMessage}
    ${message}=   Get Text    ${SuccessMessage}
    Should Be Equal As Strings    ${title}    Success   msg=Titre du message de confirmation incorrect
    Should Be Equal As Strings    ${message}    ${message_expected}     msg=Message de confirmation incorrect

