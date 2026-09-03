// importando a biblioteca 
const fs = require('fs');
const entrada = require('readline-sync');
    
console.log(" === SISTEMA DE CONSULTA DE ESTOQUE 🛠️ === \n");

try{
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    function procurarEstoque() {
        const pesquisa = produtos.filter(p => p.qtd < 100)
        console.log(pesquisa)
    }
    procurarEstoque()
    }
catch (error) {
    console.error("Erro ao acessar o banco de dados:" + error.message);
}