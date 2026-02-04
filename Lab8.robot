*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://computing.kku.ac.th

*** Test Cases ***
Open Website Should Work
    Title Should Be    College of Computing, Khon Kaen University

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080

    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
