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
Login Valide
    [Arguments]    ${vEMailAddress}    ${vPasswordLogin}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window
    Click Element    ${lnk_MyAccount}
    Sleep    2
    Click Element    ${lnk_Login}
    Input Text    ${txt_EMailAddress}    ${vEMailAddress}
    Input Password    ${txt_PasswordLogin}    ${vPasswordLogin}
    Click Button    ${btn_Login}
    Wait Until Page Contains     My Account
    Close All Browsers

*** Test Cases ***
Login avec informations d'indetification valide
    Login Valide    76543266@hotmail.com     23456
