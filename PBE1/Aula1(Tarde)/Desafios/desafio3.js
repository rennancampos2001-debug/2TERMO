const entrada = require('readline-sync'); 

const gasolina = entrada.questionFloat("Qual e o preço da gasolina ? (por litros)")
const alcool = entrada.questionFloat("Qual e o valor do alcool ? (por litros) ")

diferenca = alcool / gasolina

if (diferenca <=0.7){
    console.log("Abasteça com Alcool")
}else{
    console.log("Abasteça com Gasolina")
}