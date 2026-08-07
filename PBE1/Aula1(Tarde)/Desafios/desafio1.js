const entrada = require('readline-sync'); 

const nome = entrada.question("Seu nome: ")
const nascimento = entrada.questionInt("Ano que voce nasceu: ")

idade = 2026 - nascimento

if (idade >= 16) {
    console.log(`PARABENS ${nome} ! Você está apto para votar`)
}else{
    console.log(`${nome} você não está apto para votar`)
}