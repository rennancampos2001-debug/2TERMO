const entrada = require('readline-sync')

// Importar modulo funcoesOficina
const oficina = require('./funcoesOficina')

console.log("=== Sistema de Gestao de Oficina ===")

const peca = entrada.questionFloat("Preco da peca: R$ ")
const horas = entrada.questionInt("Horas de servico: ")
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto:")

const statusGarantia = oficina.verificarGarantia(tempoUso) 
const total = oficina.calcularOrcamento(peca, horas)
const desconto = oficina.calcularDesconto(total)

//Relatorio Final
console.log("\n--- Relatorio de Servico ---")
console.log(`Orcamento: R$ ${total.toFixed(2)}`)
console.log(`Oeçamento com desconto (5%): R$ ${desconto.toFixed(2)}`)
console.log(`Status da Garantia: ${statusGarantia}`)
console.log("-".repeat(15))