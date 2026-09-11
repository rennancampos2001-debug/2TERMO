const entrada = require('readline-sync');
const sensor = require('./sensor')

console.log('=== Sistema de Verificacao (Temperatura e Umidade) ===')

const temperatura = entrada.questionFloat ("Informe a temperatura: ")
const umidade = entrada.questionFloat ("Informe a Umidade: ")

const verificaTemp = sensor.checarTemperatura(temperatura)
const verificaUmi = sensor.checarUmidade(umidade)

console.log("\n=== Relatorio de Avisos ===")
console.log(verificaTemp)
console.log(verificaUmi)