const entrada = require('readline-sync');

const nomes = [];

for (i = 0; i < 5; i++) {
    const nome = entrada.question(`Informe o nome do Operador ${i+1}: `)
    nomes.push(nome)
}
for (i = 0; i < nomes.length; i++) {
    console.log(i + 1 + " - " + nomes[i])
}