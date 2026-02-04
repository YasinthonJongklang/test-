*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://computing.kku.ac.th

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    __import__('selenium.webdriver').webdriver.ChromeOptions()

    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080

    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
