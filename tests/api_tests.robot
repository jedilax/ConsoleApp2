*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Check Home Endpoint
    Create Session    myapi    ${BASE_URL}
    ${resp}=    GET    myapi    /
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Evaluate    ${resp.json()}
    Should Be Equal As Strings    ${json["message"]}    Hello, CI/CD World!

Check Health Endpoint
    Create Session    myapi    ${BASE_URL}
    ${resp}=    GET    myapi    /health
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Evaluate    ${resp.json()}
    Should Be Equal As Strings    ${json["status"]}    OK

