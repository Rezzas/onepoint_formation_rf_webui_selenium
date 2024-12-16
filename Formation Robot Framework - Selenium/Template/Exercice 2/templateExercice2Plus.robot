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
# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords

# Exemple :
${MA_VARIABLE}   AAAA
${URL}   https://aaaa.com
${BROWSER}    Chrome

# Déclarer une liste dans la section Variables (--> PAS BESOIN du Keyword Create List)
@{MA_LISTE_DES_ATTENDUS}    attendu1    attendu2    attendu3    attenduN

# La liste peut être vide puis remplit par la suite
@{MA_LISTE_DES_TEXTES_RECUPERES}

*** Test Cases ***
# Renommer clairement le Test Case, exemple : Verifier Menus Volet Gauche
Mon Test Case Exercice 2

    # Objectifs :
        # Se connecter et atteindre la page d'accueil (exercice 1A)
        # Récupérer les valeurs du volet roulant gauche (Admin, PIM, Leave, Time, Recruitement, ...)
        # Comparer la liste des attendus à la liste des valeurs récupérées

    # Objectif Bonus :
        # Afficher dans les logs de la console les noms des menus attendus comparés aux noms des menus récupérés
        # Astuce : utiliser la boucle FOR IN ZIP

    # Appel de nos propres Keywords
    Reutiliser Mon Test Case De Connexion De L'Exercice 1A Et En Faire Un Keyword
    Declarer Un Autre Keyword Utile Pour Découper Logiquement Mon Test

    # Keywords utiles :
    ${ELEMENTS_RECUPERES}=    Get WebElements    variable_locator.py
    ${TEXTE_RECUPERE}=    Get Text    Web_Element (ou) variable_locator.py

    # Appeler une liste avec "Append To List" ou "Lists Should Be Equal" (--> utiliser le $)
    Append To List   ${MA_LISTE_DES_TEXTES_RECUPERES}    ${TEXTE_RECUPERE}
    Lists Should Be Equal    ${MA_LISTE_DES_TEXTES_RECUPERES}    ${MA_LISTE_DES_ATTENDUS}    msg=ERREUR LISTE DIFFERENTE    values=True    names=None    ignore_order=True

    # Appeler une liste dans une boucle FOR (--> utiliser le @)
    FOR  ${element}  IN  @{ELEMENTS_RECUPERES}
       Log To Console  ${element}
    END

    # Déclarer une liste dans un Test Case ou un Keyword (--> AVEC le Keyword Create List)
    @{ma_liste_local}=  Create List  item1  item2  item3

    # A noter : une liste peut être appelé de deux manières différentes via le @ ou le $
    # Appel d'une liste via $ = appel de la liste complète [item1, item2, item3]
    # Appel d'une liste via @ = appel de chaque item de la liste un par un : item1 > item2 > item3 (unpack)
    # https://www.docstring.fr/glossaire/unpacking/

    # Astuce : il est possible d'accéder aux méthodes et aux attributs d'un objet directement depuis l'appel de la variable
    # Exemple : la classe WebElement a pour attribut text, il est donc possible de faire ${element.text}
    # Cela évite de faire : ${TEXTE_RECUPERE}=   Get Text    ${element}

    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-syntax
    # https://www.selenium.dev/selenium/docs/api/py/webdriver_remote/selenium.webdriver.remote.webelement.html

*** Keywords ***
# Utiliser cette section pour déclarer vos Keywords qui seront utilisés par votre Test Case
# A noter : un fichier .robot sans Test Case (avec uniquement des Keywords) ne fera rien
# Un fichier .robot exécute un Test Case qui utilise des Keywords

# Nommer clairement vos Keywords, exemple : Recuperer Texte Menus Volet Gauche
# Bonne pratique : faites commencer vos Keywords par un verbe d'action

# Réutiliser l'exercice 1A pour vous connecter à la page d'accueil
Reutiliser Mon Test Case De Connexion De L'Exercice 1A Et En Faire Un Keyword
    Open Browser    ${URL}    ${BROWSER}
    # etc.

Declarer Un Autre Keyword Utile Pour Découper Logiquement Mon Test
