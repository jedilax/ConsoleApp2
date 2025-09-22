*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://127.0.0.1:5000    # Change to http://<VM_WITH_API_IP>:5000 if API runs on another VM

*** Test Cases ***
Home Should Say Hello
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /
    Status Should Be    200    ${resp}
    ${body}=    Set Variable    ${resp.json()}
    Should Be Equal As Strings    ${body['message']}    Hello, CI/CD World!

Health Should Be OK
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /health
    Status Should Be    200    ${resp}
    ${body}=    Set Variable    ${resp.json()}
    Should Be Equal As Strings    ${body['status']}    OK
