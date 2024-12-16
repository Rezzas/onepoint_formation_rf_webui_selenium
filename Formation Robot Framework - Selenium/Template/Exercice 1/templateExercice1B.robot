############
# SETTINGS #
############
# Importer la librairie Selenium
# Ajouter les options suivantes lors de l'import de la librairie
# implicit_wait=0:00:30    timeout=0:00:30


#############
# VARIABLES #
#############
# Si nécessaire déclarer des variables ici,
# Sinon vous pouvez tout mettre dans le Test Case directement
# Exemple :
#${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

# Les variables déclarées ici sont visibles par le Test Case ainsi que par tous les Keywords
# Cela permet de faire transiter efficacement de l'information sans avoir à utiliser de RETURN


##############
# TEST CASES #
##############
# Ajouter le tag :
# [Tags]  exercice 1B

# Ligne de commande pour éxécuter le Test Case :
# robot -d "Resultats/Exercice 1B/" -i "exercice 1B" Tests

# Objectifs :
#       Ouvrir le navigateur et aller sur la bonne URL (voir VARIABLES>URL)
#       Renseigner le champ username et/ou le champ password avec une valeur erronée (autre que Admin/admin123)
#       Cliquer sur le bouton de connexion
#       Vérifier la présence du message d'erreur qui prouve la non connexion
#       Fermer le navigateur

# Respecter la bonne pratique de 1 Test Case par fichier .robot
# La Test Suite est le dossier qui contient les différents fichiers .robot

# Nommer clairement le Test Case, exemple : Login Mauvais Mot De Passe

# Avant toute action, forcer la vitesse de Selenium à 1s : Set Selenium Speed  1s
# Cela vous permettra de bien voir ce qu'il se passe

# Keywords utiles (voir le fonctionnement dans la doc associée) :
#       Create Webdriver
#       Go To
#       Open Browser (équivalent de Create WebDriver + Go To)
#       Title Should Be
#       Element Should Be Visible
#       Input Text
#       Click Element
#       Click Button (attention, ce keyword ne fonctionne pas si le bouton n'est pas un <button> dans le code HTML)
#       Element Text Should Be
#       Sleep
#       Close Browser

# Utiliser les locators suivants :
#        Champ Password     : name:username
#        Champ Username     : name:password
#        Bouton Log In      : xpath://button[@type='submit']
#        Message Erreur     : xpath://p[contains(@class, 'oxd-alert-content-text')]

# Documentation :
#        https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
#        https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Timeout
#        https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Implicit%20wait
#        https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Set%20Selenium%20Speed
#        https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Sleep
