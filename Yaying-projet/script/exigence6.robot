*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    DateTime
Library    String
Library    Dialogs
Library    OperatingSystem
Library    Collections
Variables    ../resourcess/Locators.py

*** Variables ***
${vURL}           http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}       chrome
${TIMEOUT}        5s

*** Keywords ***
Rechercher des produits
    [Arguments]    ${vSearch}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window
    Input Text    ${txt_Search}    ${vSearch}
    Click Button    ${btn_Search}
    Wait Until Page Contains    Search -
    Close All Browsers

*** Test Cases ***
l'utilisateur est en mesure de rechercher des produits
    Rechercher des produits    samsung
