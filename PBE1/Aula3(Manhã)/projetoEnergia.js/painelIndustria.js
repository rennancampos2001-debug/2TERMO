const entrada = require('readline-sync')

const energia = require('./calculoEnergia')

console.log("=== Monitor de Eficiencia Energetica Industrial ==")

const nomeMaquina = entrada.question("Nome da maquina: ")
const potenciaWatts = entrada.questionInt("Potencia em Watts: ")
const usoMes = entrada.questionInt("Horas de uso mensal: ")
const precoKwh = entrada.questionFloat("Preco do kWh: ")

const totalKwh = energia.calcularKwh(potenciaWatts, usoMes)
const custo = energia.calcularCusto(totalKwh, precoKwh)
const classificacao = energia.classificarConsumo(totalKwh)

console.log("=== Relatorio de Eficiencia ===")
console.log(`Nome da Maquina: ${nomeMaquina.toUpperCase()}`)
console.log(`Consumo Total: ${totalKwh.toFixed(2)}`)
console.log(`Custo Total R$ ${custo.toFixed(2)}`)
console.log(`Classificação: ${classificacao}`)