*** Settings ***
Library         SeleniumLibrary
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser

*** Variables ***
${URL}          https://computing.kku.ac.th

*** Test Cases ***
Open Website Should Work
    Title Should Contain    Computing

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
    
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080
    
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
