*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 5/" -i "exercice 5" Tests
...             Keywords String : https://robotframework.org/robotframework/latest/libraries/String.html
...             Doc DataDriver : https://github.com/Snooz82/robotframework-datadriver
Force Tags      template exercice 5
Library         String
Library         DataDriver      file=../../Jeux de donnees/data.csv     encoding=utf_8      dialect=unix
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  0.5s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

# Définir le template :
Test Template   Le TEMPLATE


*** Variables ***
# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords

# Exemple :
${MA_VARIABLE}   AAAA
${URL}   https://aaaa.com
${BROWSER}    Firefox


*** Test Cases ***
# Renommer clairement le Test Case, exemple : Verifier Menus Volet Gauche
Mon Test Case Exercice 5

# /!\ ATENTION /!\
#       EN MODE DATA DRIVEN
#       TOUT SE PASSE DANS LA PARTIE KEYWORDS
#       LE TEST CASE NE SERT QUE DE TEMPLATE PAR DEFAUT

    # Objectifs :
        # Utiliser le fichier fourni en entrée contenant 2 JDD : data.csv et les 2 fichiers png fournis
        # pour faire un upload de fichier dans le champ « Job Specification » (utiliser la méthode Choose File)
        # Bien penser à mettre le test case « Verifier Ajout job titles » dans la rubrique Keywords
        # Ecrire le test case en Gherkin
        # Les champs « Job Description », « Job Specification » et « Note » étant des champs facultatifs, vérifier que la valeur de ces champs n’est pas vide dans le fichier avant de les renseigner (utiliser la méthode Run Keyword If)
        # Vérifier le message de confirmation lors de l’ajout
        # Les job titles ajoutés sont uniques et doivent être supprimés avant de pouvoir être de nouveau ajoutés

    # Keywords utiles (voir le fonctionnement dans la doc associée) :
        # Choose File
        # Run Keyword If

    # Documentation Template :
        # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-templates

*** Keywords ***
Le TEMPLATE
    [Arguments]     ${Job_title}    ${Job_description}      ${Job_file}     ${Job_note}

    Login

    Go to    https://opensource-demo.orangehrmlive.com/web/index.php/admin/saveJobTitle

    Input Text    ${JobTitleInput}    ${Job_title}
    Input Text  ${JobDescriptionInput}  ${Job_description}

    Choose File  ${JobSpecificationInput}   ${Job_file}

    Input Text  ${NoteInput}  ${Job_note}

    Click Element  ${SaveButton}

    Element Text Should Be   ${SuccessMessage}  Successfully Saved

    Sleep  4s


    
#     Run Keyword If      string_1!=string_2
#     ...    Input Text    variable_locator.py    string_1
#     # exemple de condition : '${Job_description}'!='${EMPTY}'

#     Choose File    variable_locator.py    chemin_vers_fichier_a_upload


Login
    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   Firefox
    ...                       remote_url=http://firefox:4444
    Maximize Browser Window
    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin123
    Click Element   ${LoginButton}
    Element Text Should Be    ${TitleDashboard}  Dashboard
    