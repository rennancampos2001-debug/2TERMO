const entrada = require('readline-sync');

const balanca = require('./funcoesBalanca')

let sistemaAtivo = true

while (sistemaAtivo) {
    try {

        console.log(` === Balanca de Precisao Industrial ===`);

        const leitura = entrada.question("Digite o peso: (ou sair) ")

        if (leitura.toLowerCase() === 'sair') break

        let resultado = balanca.verificarPeso(leitura)

        console.log(`\n✅ SUCESSO: o peso foi de: ${resultado} g`);

    }
    catch (erro){
        console.log(`\n⚠️  ALERTA: ${erro.message}`);
    }
}