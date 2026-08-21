const entrada = require('readline-sync')

const logistica = require('./calculadoraFrete')

console.log("=== Sistema Expresso Industrial ===")

const produto = entrada.question("Produto a ser transportado: ")
const km = entrada.questionInt("Distancia (km): ")
const valorCarga = entrada.questionFloat("Valor da carga: R$ ")

const freteBase = logistica.calcularBase(km)
const seguro = logistica.calcularSeguro(valorCarga)
const prazo = logistica.verificarPrazo(km)
const totalGeral = freteBase + seguro

console.log("\n--- Relatorio de Postagem ---")
console.log(`Produto: ${produto}`)
console.log(`Prazo de entrega: ${prazo}`)
console.log(`Frete base: R$ ${freteBase.toFixed(2)}`)
console.log(`Seguro: R$ ${seguro.toFixed(2)}`)
console.log(`Total: R$ ${totalGeral.toFixed(2)}`)
console.log("-".repeat(25))