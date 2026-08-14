const entrada = require('readline-sync');

console.log("---Controle de acesso do laboratorio---")

const idade = entrada.questionInt("Qual e a sua idade ? ")
const autorizacao = entrada.keyInYNStrict("Voce tem autorizacao para entrar ? ")
const acompanhado = entrada.keyInYNStrict("Algum professor esta te acompanhando ? ")
const suspenso = entrada.keyInYNStrict("Voce esta suspenso ? ")

    if (suspenso == true) {
        console.log("---Entrada Negada !---")
    }else if (idade >= 16 && autorizacao == true || acompanhado == true){
        console.log("---Entrada Permitida !---")
    }else{
        console.log("---Entrada Negada !---")
    }