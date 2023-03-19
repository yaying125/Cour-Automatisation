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
Rsgister Account
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
    Select Checkbox    ${opt_Policy}
    Click Button    ${btn_Continue}
    Wait Until Page Contains    Your Account Has Been Created!
    Close All Browsers

*** Test Cases ***
L'utilisateur peut s'inscrire dans l'application 
    Rsgister Account    123456    567    76543266@hotmail.com     4567777    23456    23456
