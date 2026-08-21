const entrada = require('readline-sync');

const nomeProduto = entrada.question("Informe o nome do produto: ");
const valorProduto = entrada.questionFloat("Informe o valor do produto: ");
let numeroParcelas = entrada.questionInt("Informe a quantidade de parcelas: ");

while (numeroParcelas < 1 || numeroParcelas > 12) {
    console.log(`Quantidade invalida! Insira um numero de 1 a 12 parelas`);

    numeroParcelas = entrada.questionInt("Informe a quantidade de parcelas: ")
}

const calculo = (valorProduto / numeroParcelas);

for (let i = 0; i < numeroParcelas; i++ ) {
    console.log(`Produto ${nomeProduto} | Parcela ${i+1}:R$ ${calculo.toFixed(2)}`)}