const entrada = require('readline-sync');

const pecasDefeituosas = []

const qntdPecas = entrada.questionInt("Quantas pecas defeituosas foram encontradas: ")

for (i = 0; i < qntdPecas; i++) {
    const seriePeca = entrada.questionInt(`Qual e o numero de serie da peca ${i}: `)

    pecasDefeituosas.push (seriePeca)
}

console.log("=== Relatorio de Qualidade ===")
console.log(`Total de pecas: ${pecasDefeituosas.length} - Numeros de serie: ${pecasDefeituosas}`)