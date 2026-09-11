const entrada = require('readline-sync');

const nomeMaterial = entrada.question('Informe o nome do material: ');
const quantidade = entrada.questionInt(`Informe a quantidade de unidades deste material: `);
const precoUni = entrada.questionFloat(`Informe o preco unitario do material: `)

const valorTotal =  quantidade * precoUni

console.log(`Foram comprados ${quantidade} unidades do material ${nomeMaterial} pelo valor de R$ ${precoUni.toFixed(2)} cada unidade, resultando em um valor total de: R$ ${valorTotal.toFixed(2)}`);