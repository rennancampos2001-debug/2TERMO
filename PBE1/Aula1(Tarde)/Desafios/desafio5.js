const entrada = require('readline-sync'); 

const renda = entrada.questionFloat("Sua renda: ")
const nomeSujo = entrada.keyInYNStrict("O seu nome esta sujo ? ")

if (renda > 2000 && nomeSujo === true){
    console.log("PARABENS! Emprestimo Aprovado")
}else{
    console.log("Sinto muito! Emprestimo Negado")
}