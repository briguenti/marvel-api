*Settings*
Documentation   Aqui é onde tudo começa

Library     RequestsLibrary

Resource    routes/characters.robot

*Variables*
${base_url}     http://marvel.qaninja.academy

*Keywords*
Super Setup
    [Arguments]     ${email}

    Set Client Key  ${email}
    Back To The Past

Set Client Key
    [Arguments]     ${email}

    &{usuario}  Create Dictionary   email=${email}

    ${response}     POST    
    ...             ${base_url}/accounts  
    ...             json=${usuario}     

    ${client_key}  Set Variable    ${response.json()}[client_key]
    &{HEADERS}  Create Dictionary   client_key=${client_key} 

    Set Suite Variable     ${HEADERS}

Back To The Past

    DELETE      ${base_url}/delorean    headers=${HEADERS}