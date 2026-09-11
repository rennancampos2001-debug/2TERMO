const entrada = require('readline-sync');

function calcularEficiencia(real,prevista) {
    return real / prevista * 100
}

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return `A meta foi ATINGIDA em ${percentual}% (META ATINGIDA)`
    }else if (percentual <= 89.99 && percentual >= 70){
        return `ATENCAO, cuidado pois a meta esta somente ${percentual}% completa`
    }else{
        return `A producao esta ABAIXO da media, com somente ${percentual}% (ABAIXO DA META)`
    }
}

const prevista = entrada.questionInt("Qual e a meta a ser cumprida: ")
const real = entrada.questionInt("Quantas conseguiram cumprir: ")

const percentual = calcularEficiencia (real, prevista)

console.log(`Prevista = ${prevista} | Real = ${real} | ${classificarEficiencia(percentual)}`);