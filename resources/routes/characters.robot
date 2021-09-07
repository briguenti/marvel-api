*Settings*
Documentation   Ações da rota/characters

*Keywords*
POST New Character
    [Arguments]     ${payload}

    ${response}     POST    
    ...             ${base_url}/characters    
    ...             json=${payload}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [return]        ${response}