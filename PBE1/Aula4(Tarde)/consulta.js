// importando a biblioteca 
const fs = require('fs');
const entrada = require('readline-sync');
    
console.log(" === SISTEMA DE CONSULTA DE ESTOQUE 🛠️ === \n");

try{
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const termoBusca = entrada.question("Digite o nome do produto para buscar:");

    const resultado = produtos.filter(p=> p.nome.toLowerCase() === termoBusca.toLowerCase());

    if (resultado.length > 0) {
        console.log("\n PRODUTO ENCONTRADO ✅");
        console.log(`ID: ${resultado[0].id}`);
        console.log(`Nome: ${resultado[0].nome}`);
        console.log(`Quantidade em estoque: ${resultado[0].qtd}`);
    } else {
        console.log("\n PRODUTO NÃO ENCONTRADO ❌");
    }
} catch (error) {
    console.error("Erro ao acessar o banco de dados:" + error.message);
}