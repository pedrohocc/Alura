export function valida(input) {

    const tipo_input = input.dataset.tipo

    if(validadores[tipo_input]) {

        validadores[tipo_input](input)

    }

}

const validadores = {

    data_nascimento:input => valida_data_nascimento(input)

}


function valida_data_nascimento(input) {

    const data_form = new Date(input.value)
    let mensagem = ''

    if (!maior_idade(data_form)) {
        
        mensagem = 'Você deve ser maior de idade!'

    }

    input.setCustomValidity(mensagem)

}

function maior_idade (data) {

    const data_atual = new Date()
    const data_18 = new Date(data.getUTCFullYear() + 18, data.getUTCMonth(), data.getUTCDate())

    return data_18 <= data_atual

}