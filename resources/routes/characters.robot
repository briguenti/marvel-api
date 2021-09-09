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

GET Character By Id 
    [Arguments]     ${character_id}

    ${response}     GET
    ...             ${base_url}/characters/${character_id}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [Return]        ${response}

DELETE Character By Id 
    [Arguments]     ${character_id}

    ${response}     DELETE
    ...             ${base_url}/characters/${character_id}
    ...             headers=${HEADERS}
    ...             expected_status=any

    [Return]        ${response}