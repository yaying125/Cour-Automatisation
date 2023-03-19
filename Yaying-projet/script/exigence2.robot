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
Optant pour l'abonnement à la Newsletter
    [Arguments]    ${vFirstName}    ${vLastName}    ${vEMail}    ${vTelephone}    ${vPassword}    ${vPasswordConfirmer}
    Set Selenium Timeout    ${TIMEOUT}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window
    Click Element    ${lnk_MyAccount}
    Sleep    2
    Click Element    ${lnk_Register}
    Input Text    ${txt_FirstName}    ${vFirstName}
    Input Text    ${txt_LastName}    ${vLastName}
    Input Text    ${txt_EMail}    ${vEMail}
    Input Text    ${txt_Telephone}    ${vTelephone}
    Input Password    ${txt_Password}    ${vPassword}
    Input Password    ${txt_PasswordConfirmer}    ${vPasswordConfirmer}
    Select Radio Button    ${txt_group}     ${opt_Subscribe}
    Select Checkbox    ${opt_Policy}
    Click Button    ${btn_Continue}
    Wait Until Page Contains    Your Account Has Been Created!
    Close All Browsers

*** Test Cases ***
l'utilisateur peut s'inscrire à l'application en optant pour l'abonnement à la Newsletter
    Optant pour l'abonnement à la Newsletter    123422    567    7654222@hotmail.com     4567777    23456    23456
