*Settings*
Documentation   Suite de teste de exclusão de personagens na API da Marvel

Resource    ${EXECDIR}/resources/base.robot
Library     ${EXECDIR}/resources/factories/xmen.py

Suite Setup     Super Setup     vinibriguenti@hotmail.com

*Test Cases*
Deve remover um personagem pelo ID

    ${personagem}       Factory Ciclope
    ${ciclope}          POST New Character  ${personagem}
    ${ciclope_id}       Set Variable        ${ciclope.json()}[_id]

    ${response}         DELETE Character By Id     ${ciclope_id}

    Status Should Be    204     ${response}

    ${response2}        GET character By Id     ${ciclope_id}

    Status Should Be    404     ${response2}

Não deve encontrar o personagem pelo ID

    ${personagem_id}    Get Unique Id

    ${response}     DELETE Character By Id   ${personagem_id}

    Status Should Be    404     ${response} 