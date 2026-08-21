const entrada = require('readline-sync')

const nome = entrada.question("Informe seu nome: ");
let idade = entrada.questionInt("Informe sua idade: ");
const tempoContribuicao = entrada.questionFloat("Informe o tempo em anos de contribuicao do trabalhador: ")

if (idade >= 65 || (tempoContribuicao >=30)) {
    console.log(`\nO trabalhador ${nome} já pode se aposentar`)
} else {
    console.log(`\nO trabalhador ainda não pode se aposentar`)
}