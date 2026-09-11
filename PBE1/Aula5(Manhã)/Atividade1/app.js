const entrada = require('readline-sync');
const conversor = require('./conversor');

console.log('=== Sistema de Conversão Real -> Dolar ===');

const valorReal = entrada.questionFloat ("Qual e o valor que gostaria de converter ? ")

const conversao = conversor.converter(valorReal)

console.log("\n=== Relatorio da conversao ===")
console.log(`\nO valor em Reais é de: ${valorReal}`)
console.log(`O valor convertido para Dolar é de: ${conversao}`)
console.log("=".repeat(15))