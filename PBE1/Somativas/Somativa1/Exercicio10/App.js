const entrada = require('readline-sync');
const manutencao = require('./funcoesManutencao')

const nome = entrada.question("Informe o nome da maquina: ")
const valor = entrada.questionFloat("Informe o valor das pecas: ")
const horas = entrada.questionInt("Informe a quantidade de horas: ")
const ultimaManut = entrada.questionInt("Meses desde a ultima manutencao: ")

const maoObra = manutencao.calcularMaoDeObra(horas)
const total = manutencao.calcularTotal(valor, maoObra)
const garantia = manutencao.verificarGarantia(ultimaManut)

console.log = (` Maquina: ${nome} | Mao de obra: R$ ${maoObra} | Pecas: R$ ${valor} | Total: R$ ${total}) | Garantia: ${garantia}`)