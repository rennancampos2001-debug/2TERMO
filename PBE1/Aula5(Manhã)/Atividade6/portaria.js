const entrada = require('readline-sync');

const listaVisitantes = []

while (true) {
    let opcao = entrada.keyInYNStrict ("Deseja cadastrar um novo visitante ? ")

    if (opcao === false){
        for (let i of listaVisitantes){
            console.log(`Nome: ${i.nome} | Empresa: ${i.empresa}`)
        }
        break
    }else{
        const nome = entrada.question("Informe o nome: ")
        const empresa = entrada.question("Informe a empresa: ")

        const cadastroVisitante = {
            nome : nome,
            empresa : empresa
        }
        listaVisitantes.push(cadastroVisitante)
    }
}