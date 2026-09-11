const entrada = require('readline-sync');

const peso = entrada.question('Informe o peso da peca: ');

if (peso >= 95 & peso <= 105) {
    console.log(`Sua peca esta aprovada com o peso de: ${peso}g`);
}else{
    console.log(`Sua peca foi reprovada com o peso de: ${peso}g`);
}