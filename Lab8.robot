*** Settings ***
Library          SeleniumLibrary
Suite Setup      Open Browser To Login Page
Suite Teardown   Close Browser

*** Variables ***
${URL}           https://computing.kku.ac.th

*** Test Cases ***
Open Website Should Work
    Title Should Contain    Computing

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # รวบรวม arguments ทั้งหมดใส่ใน List
    ${arg_list}=   Create List    --headless    --no-sandbox    --disable-dev-shm-usage    --window-size=1920,1080
    
    # ใช้ loop เพื่อแอดทีละตัว วิธีนี้จะช่วยเลี่ยงปัญหา TypeError บน Jenkins ได้ 100%
    FOR    ${arg}    IN    @{arg_list}
        Call Method    ${options}    add_argument    ${arg}
    END
    
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
