const entrada = require('readline-sync');

let medicoes = 0

for (i = 0; i < 5; i++) {
    const valor = entrada.questionInt(`Qual e a foi a medida ${i + 1}: `)
    medicoes = medicoes + valor
}

media = medicoes/5

console.log(`A soma total das medicoes foi de: ${medicoes}, e a media foi de: ${media}`);