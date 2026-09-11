const entrada = require('readline-sync');

const pecasCiclo = entrada.questionInt('Informe a quantidade de pecas produzidas por ciclo: ');
let pecasTotal = pecasCiclo

for (let i = 0; i < 10; i++) {
    console.log(`A quantidade de pecas fabricadas no ciclo ${i + 1} foi de: ${pecasTotal} pecas`)
    pecasTotal = pecasTotal + pecasCiclo
}