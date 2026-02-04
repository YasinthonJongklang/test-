*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://computing.kku.ac.th

*** Test Cases ***
Open Website Should Work
    Title Should Contain    Computing

*** Keywords ***
Open Browser To Login Page
    ${options}=    Create List
    ...    --headless=new
    ...    --no-sandbox
    ...    --disable-dev-shm-usage
    ...    --window-size=1920,1080

    Open Browser    ${URL}    chrome    options=${options}
