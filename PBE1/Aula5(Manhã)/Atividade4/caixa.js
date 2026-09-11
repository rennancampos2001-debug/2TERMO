const entrada = require('readline-sync');
const vendas = require('./calculosVendas');

const nome = entrada.question("Qual e o seu nome: ")
const preco = entrada.questionFloat("Qual e o preco do produto: ")
const quantidade = entrada.questionInt("Qual a quantidade que voce quer levar: ")

const valor = vendas.calcularTotal(preco, quantidade)

console.log("\n=== Relatorio de Venda ===")
console.log(vendas.gerarCupom (nome, valor.toFixed(2)))