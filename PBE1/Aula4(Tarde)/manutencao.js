const fs = require('fs');
const entrada = require('readline-sync');
    
console.log(" === SISTEMA DE ALETRA DE MANUTENÇÃO === \n");

try{
    const dados = fs.readFileSync("manutencao.json", "utf8");
    const manutencao = JSON.parse(dados);

    const maquinaPerigo = manutencao.filter(p => p.horasUso > 1000)

    console.log("As maquinas precisam de manutenção")

    maquinasPerigo.forEach(maquina => {
    console.log(maquina.nome);
});

fs.manutencaoUrgente(
    "manutencao_urgente.json",
    json.stringfify(maquinaPerigo, null, 2)
)
}

catch (error) {
    console.error("Erro ao acessar o banco de dados:" + error.message);
}