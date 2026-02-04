*** Settings ***
Library          SeleniumLibrary
Suite Setup      Open Browser To Login Page
Suite Teardown   Close Browser

*** Variables ***
${URL}           https://computing.kku.ac.th
# ชื่อ Title ของหน้าเว็บจริงๆ คือ "วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น - College of Computing, Khon Kaen University"
${EXPECTED_TITLE}    วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น - College of Computing, Khon Kaen University

*** Test Cases ***
Open Website Should Work
    # ระบุ Library นำหน้าเพื่อป้องกันปัญหา "No keyword found"
    SeleniumLibrary.Title Should Be    ${EXPECTED_TITLE}

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${arg_list}=   Create List    --headless    --no-sandbox    --disable-dev-shm-usage    --window-size=1920,1080
    FOR    ${arg}    IN    @{arg_list}
        Call Method    ${options}    add_argument    ${arg}
    END
    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}
