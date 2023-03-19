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
Passer une commande
    [Arguments]    ${vSearch}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window
    Input Text    ${txt_Search}    ${vSearch}
    Click Button    ${btn_Search}
    Wait Until Page Contains    Search -
    Click Element    ${lnk_AddToCard}
    Click Element    ${lnk_Checkout}
    Click Element    ${btn_Checkout}
    Wait Until Page Contains     Products marked with *** are not available in the desired quantity or not in stock!


    Close All Browsers

*** Test Cases ***
l'utilisateur peut passer une commande
    Passer une commande   samsung
