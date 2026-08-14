const entrada = require('readline-sync'); 

const conta = entrada.questionFloat("Quanto deu a conta ? ")

desconto = conta * 0.10

if (conta >= 100) {
    console.log(`O valor total da conta é de $${conta - desconto}`)
}else{
    console.log(`O valor total da conta é de $${conta}`)
}