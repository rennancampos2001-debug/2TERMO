const entrada = require('readline-sync')

function calcularArea (largura, comprimento) {
    return (largura * comprimento) 
}

for(let i = 1; i < 4; i++) {

    let largura = entrada.questionFloat(`Informe a largura do terreno ${i}: `)

    let comprimento = entrada.questionFloat(`Informe o comprimento do terreno ${i}: `)

    let area = calcularArea(largura, comprimento)

    console.log(`O terreno ${i} tem area de ${area} m quadrados`);

}