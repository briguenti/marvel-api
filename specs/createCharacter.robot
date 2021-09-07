*Settings*
Documentation   Suite de teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/thanos.py

Suite Setup     Super Setup vinivini@gmail.com

*Test Cases*
Deve cadastrar um personagem

    ${personagem}   Factory Star Lord
    ${response}     POST New Character       ${personagem}

    Status Should Be    200     ${response}

Não deve cadastrar com o mesmo nome

    [Tags]  dup
    # Dado que Thanos já existe no sistema
    ${personagem}   Factory Groot
    POST New Character  ${personagem}

    # Quando faço uma requisição POST para a rota characters 
    ${response}     POST New Character   ${personagem}

    # Então o código de retorno deve ser 409
    Status Should Be    409     ${response}

    # Log To Console      ${response.json()}[error]
    Should Be Equal     ${response.json()}[error]   Character already exists :(