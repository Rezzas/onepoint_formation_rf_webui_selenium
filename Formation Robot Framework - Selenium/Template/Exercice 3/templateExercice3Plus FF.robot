*** Settings ***
Documentation
...             Commande pour éxécuter le test : robot -d "Resultats/Exercice 3/" -i "exercice 3" Tests
...             Keywords String : https://robotframework.org/robotframework/latest/libraries/String.html
...             Keywords DateTime : https://robotframework.org/robotframework/latest/libraries/DateTime.html
Force Tags      template exercice 3
Library         String
Library         DateTime
Library         SeleniumLibrary    implicit_wait=0:00:30    timeout=0:00:30
Test Setup      Set Selenium Speed  0.5s
Test Teardown   Close Browser
Variables       ../../Ressources/locators.py

*** Variables ***
# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords

# Exemple :
${MA_VARIABLE}   AAAA
${URL}   https://aaaa.com
${BROWSER}    Firefox

*** Test Cases ***
# Renommer clairement le Test Case, exemple : Verifier Menus Volet Gauche
Mon Test Case Exercice 3

    # Objectifs :
        # Ouvrir le navigateur et aller sur la bonne URL (voir VARIABLES>URL)
        # Se connecter et atteindre la page d'accueil (exercice 1A)
        # Accéder à la page My Info
        # Récupérer le nom et prénom de l'employé
        # Modifier son nom et prénom
        # Récupérer la date du jour à l’aide de la méthode Get Current Date au format AAAA-MM-JJ
        # Renseigner la valeur dans le champ License Expiry Date avec la méthode Input Text (Effacer au préalable le champ avec Press Keys)
        # Vérifier le message de confirmation lorsqu’on fait la sauvegarde
        # Indiquer si la sauvegarde s'est bien passée ou non (Success)

    # Objectif Bonus :
        # Récupérer le jour de naissance en cliquant sur le champ « Date of birth » et ainsi en ouvrant le calendrier
        # Le jour sélectionné dans le calendrier (surligné) a une classe dont l’attribut est –selected

    # Appel de nos propres Keywords
    Login
    Acces Menu     My Info

    Press Keys  ${EmployeeFirstName}      CTRL+a+BACKSPACE
    Input Text  ${EmployeeFirstName}    Cyrille

    Press Keys  ${EmployeeLastName}     CTRL+a+BACKSPACE
    Input Text  ${EmployeeLastName}    Piwo

    Click Element  ${MyInfoSaveButton}

    Sleep  4s

    Press Keys  ${LicenseExpiryDate}  CTRL+a+BACKSPACE


    ${today}=    Get Current Date   result_format=%Y-%m-%d

    Input Text  ${LicenseExpiryDate}    ${today}

    Click Element  ${MyInfoSaveButton}

    Element Text Should Be   ${SuccessMessage}  Successfully Updated

    # Keywords utiles :
    # ${STRING_1}    ${STRING_2}=    Split String    MA STRING    max_split=1
    # STRING_1 = MA
    # STRING_2 = STRING
    # max_split=1 --> évite des problèmes quand il y a un espace dans le prénom

    # Press Keys  variable_locator.py      CTRL+a+BACKSPACE

    # Should Be Equal As Strings    texte_1    texte_2
    # True si texte1=texte_2

    # ${today}=    Get Current Date   result_format=%Y-%m-%d

*** Keywords ***
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par votre Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action

# Réutiliser l'exercice 1A pour vous connecter à la page d'accueil
Login

    Open Browser              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   ${BROWSER}
    ...                       remote_url=http://firefox:4444
    Maximize Browser Window
    Input Text   ${UsernameInputBox}  Admin
    Input Password     ${PasswordInputBox}  admin123
    Click Element   ${LoginButton}
    Element Text Should Be    ${TitleDashboard}  Dashboard


 # Astuce : il est possible d'accéder aux méthodes et aux attributs d'un objet directement depuis l'appel de la variable
    # Exemple : la classe WebElement a pour attribut text, il est donc possible de faire ${string.format()}

    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-syntax
    # https://docs.python.org/fr/3/library/stdtypes.html#str.format

Acces Menu
    [Arguments]    ${MENU}
    Click Element    ${DynamicMenu.format('${MENU}')}

