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
Mot de passe oublié
    [Arguments]    ${vEMailAdd}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window
    Click Element    ${lnk_MyAccount}
    Sleep    2
    Click Element    ${lnk_Login}
    Click Element    ${lnk_ForgottenPassword}
    Input Text    ${txt_EMailAdd}    ${vEMailAdd}
    Click Button    ${btn_Contine2}
    Wait Until Page Contains      An email with a confirmation link has been sent your email address.

    Close All Browsers

*** Test Cases ***
l'utilisateur est en mesure de réinitialiser le mot de passe oublié
    Mot de passe oublié    76543266@hotmail.com
