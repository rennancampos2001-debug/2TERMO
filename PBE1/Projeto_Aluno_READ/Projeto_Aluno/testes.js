// A fábrica tem um problema de falta de controle centralizado das suas operações, o que dificulta acompanhar a produção e o estoque. Por isso, o sistema precisa permitir consultar de forma rápida o status das tarefas, os materiais disponíveis, o histórico de pedidos e o andamento geral para ajudar na tomada de decisões
//  DIA 1 | Leitura e listagem de dados JSON
// Referência: Manual do Aluno — Dia 1 | Conteúdos: persistência, fs.readFileSync(), JSON.parse() e forEach().
// A. Revisão conceitual
// 1. O que significa persistência de dados?
// Persistência de dados é basicamente salvar as informações em um lugar permanente, tipo um arquivo ou banco de dados, para que nada se perca quando a gente fecha o programa ou desliga o PC.
// 2. Qual é a diferença entre CREATE (gravar) e READ (ler)?
// CREATE é quando a gente cria e salva um registro novo no arquivo, enquanto READ é só consultar ou ler o que já tá gravado lá, sem mudar nada.
// 3. O conteúdo de um arquivo JSON é um texto ou um objeto JavaScript? Explique.
// É texto puro. O JSON é só um formato de texto pra organizar dados, e ele só vira um objeto JavaScript na memória do código depois que a gente converte usando o JSON.parse().
// 4. Quantos registros existem em maquinas.json? Como você confirmou?
// Existem X registros no arquivo. Confirmei isso fazendo a leitura do JSON e olhando o tamanho da lista com o .length no terminal (ou contando direto no arquivo).
// 5. Por que um identificador (ID) único é útil nas consultas?
// Porque ele garante que a gente encontre a máquina exata que tá procurando, sem perigo de confundir caso existam duas com o mesmo nome.
// B. Investigação do arquivo
// 6. Quais são as propriedades presentes em cada máquina? Cite exemplos de seus tipos de dados.
// __________________________________________________________________________________
// __________________________________________________________________________________
// 7. Por que utilizamos JSON.parse() depois de ler o arquivo com utf8?
// Porque o leitor de arquivos devolve tudo como um texto simples (string), e o JSON.parse() serve pra transformar esse texto em um objeto ou array que o JavaScript consiga entender de verdade.
// 8. Por que o valor lido como string não pode ser percorrido diretamente como um array de máquinas?
// Porque uma string é só uma sequência de letras e caracteres soltos. O JavaScript só entende que ali tem uma lista de itens quando a gente converte essa string em array com o JSON.parse().



// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// // console.log(typeof texto);
// // console.log(texto);

// //  texto
// const maquinas = JSON.parse(texto);

// maquinas.forEach((maquina, indice) => {
//     console.log(`${indice + 1}. ${maquina.nome}`);
// });

// const procurada = maquinas.find(maquina => maquina.id === 2);
// console.log(procurada);

// const procuradaTeste = maquinas.find(maquina => maquina.id === 99); // teste com id 'undefined'
// if (procuradaTeste !== undefined) {
//     console.log(procuradaTeste);
// } else {
// console.log("Máquina não encontrada.");
// };

// const emManutencao = maquinas.filter(
//     maquina => maquina.status === "Manutenção"
// );
// console.log(emManutencao.length);
// console.log(emManutencao);


// const paradas = maquinas.filter(maquina => maquina.status === "Parada");
// console.log(paradas); // - exibe []
// console.log(paradas.length); // - exibe 0
// // Ambos retornam vazio

// // Filter seria a melhor escolha, pois filtraria e mostraria todas as máquinas com defeito

// // Treino
// try {
// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// console.log(`Registros carregados: ${maquinas.length}`); // exibe tamanho do array maquinas
// } catch (erro) {
//     console.log("Não foi possível carregar os dados.");
//     console.log(erro.message);
// }



// -

// uinas
// // PROJETO DO ALUNO - complete as funções abaixo.
// // Execute com: npm start
// const fs = require('node:fs');
// const caminho = require('node:path');
// const ARQUIVO = caminho.join(__dirname, 'maquinas.json');

// function carregarMaquinas() {
//   const texto = fs.readFileSync(ARQUIVO, 'utf-8');
//   const maquinas = JSON.parse(texto);
//   return maquinas;
// }

// function listarMaquinas(maquinas) {
//   maquinas.forEach(maquina => {
//     console.log(`${maquina.id} - ${maquina.nome} - ${maquina.status}`)
//   });
// }

// function buscarPorId(maquinas, id) {
//   return maquinas.find(maquina => maquina.id === id);
// }

// function filtrarPorStatus(maquinas, status) {
//   return maquinas.filter(maquina => maquina.status === status);
// }

// function filtrarPorSetor(maquinas, setor) {
//   return maquinas.filter(maquina => maquina.setor === setor);
// }

// function executar() {
//   console.log('Sistema de consultas industriais - CRUD READ');
//   const maquinas = carregarMaquinas();
//   listarMaquinas(maquinas);
//   console.log('\nBusca por ID 3:');
//   console.log(buscarPorId(maquinas, 3));
//   console.log('Busca por ID 99:');
//   console.log(buscarPorId(maquinas, 99));
//   console.log('Maquinas em manutencao:');
//   console.log(filtrarPorStatus(maquinas, 'manutencao'));
//   console.log('Maquinas em operacao:');
//   console.log(filtrarPorStatus(maquinas, 'operando'));
//   console.log('Maquinas paradas:');
//   console.log(filtrarPorStatus(maquinas, 'parada'));
//   console.log('Busca por setor Usinagem');
//   console.log(filtrarPorSetor(maquinas, 'Usinagem'));
// }

// if (require.main === module) executar();
// module.exports = { carregarMaq, listarMaquinas, buscarPorId, filtrarPorStatus, filtrarPorSetor };



// -----------------------------------------------------------------------------------------------------------------------------------------------------------------

// 10. Desafios progressivos - sem gabarito

// Desafio A - Fundamental. Exiba uma linha para cada máquina no padrão ID | Nome | Status. Utilize o
// array carregado do JSON.
// Desafio B - Intermediário. Leia um ID de uma variável, localize a máquina e mostre o setor. Se não
// existir, apresente uma mensagem amigável.
// Desafio C - Intermediário. Crie uma variável com o nome de um setor. Exiba quantas máquinas
// pertencem a ele e os nomes encontrados.
// Desafio D - Avançado. Crie uma função que receba um status por parâmetro e devolva o array
// filtrado. Teste com status existente e inexistente.
// Desafio E - Transferência. Abra o projeto oficial da atividade no Classroom e identifique quais
// estruturas e métodos deste laboratório são úteis para implementar as funções pedidas. Não copie o
// laboratório sem adaptar ao formato dos dados reais.






// Desafio A - Desafio A - Fundamental. Exiba uma linha para cada máquina no padrão ID | Nome | Status. Utilize o array carregado do JSON.
console.log("---".repeat(10))
console.log("Maquinas Cadastradas")
console.log("\nID | Nome      | Status");
maquinas.forEach(maquina => {
    console.log(`${maquina.id} | ${maquina.nome} | ${maquina.status}`);
});

// Desafio B - Intermediário. Leia um ID de uma variável, localize a máquina e mostre o setor. Se não existir, apresente uma mensagem amigável.
const id = 2;
const maquinaAchada = maquinas.find(maquina => maquina.id === id);
if (maquinaAchada === undefined) {
    console.log("\nMaquina nao encontrada. Informe um id funcional.");
} else {
    console.log("---".repeat(10))
    console.log(`Busca por ID: '${id}'`)
    console.log(`\nID: ${maquinaAchada.id}`);
    console.log(`Nome: ${maquinaAchada.nome}`);
    console.log(`Setor: ${maquinaAchada.setor}`);
    console.log(`Status: ${maquinaAchada.status}`);
};

// Desafio C - Intermediário. Crie uma variável com o nome de um setor. Exiba quantas máquinas pertencem a ele e os nomes encontrados.
const nomeSetor = "Estamparia";
const maquinaPorSetor = maquinas.filter(maquina => maquina.setor === nomeSetor);

if (maquinaPorSetor[0] === undefined) {
    console.log("\nMaquina nao encontrada.");
} else {
    console.log("---".repeat(8));
    console.log(`Busca por setor: '${nomeSetor}'`);
    console.log(`Quantidade de maquinas: ${maquinaPorSetor.length}`)
    for (let m of maquinaPorSetor) {
        console.log(`\nID: ${m.id}`);
        console.log(`Nome: ${m.nome}`);
        console.log(`Setor: ${m.setor}`);
        console.log(`Status: ${m.status}`);
    };
};

// Desafio D - Avançado. Crie uma função que receba um status por parâmetro e devolva o array filtrado. Teste com status existente e inexistente.
function receberStatus(status) {
    const maquinasEncontradas = maquinas.filter(maquina => maquina.status === status);

    if (maquinasEncontradas[0] === undefined) {
        console.log("\nMaquina nao encontrada.");
    } else {
        console.log("---".repeat(8));
        console.log(`Maquinas com status '${status}'`)
        for (let m of maquinasEncontradas) {
            console.log(`\nID: ${m.id}`);
            console.log(`Nome: ${m.nome}`);
            console.log(`Setor: ${m.setor}`);
        };
    };
};

receberStatus("Ativa"); // Existente - exibe o array formatado
receberStatus("aRiVo") // Inexistente - exibe 'Maquina nao encontrada.'

// Desafio E - Transferência. Abra o projeto oficial da atividade no Classroom e identifique quais estruturas e métodos deste laboratório são úteis para implementar as funções pedidas. Não copie o laboratório sem adaptar ao formato dos dados reais.
