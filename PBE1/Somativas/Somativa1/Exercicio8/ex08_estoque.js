const entrada = require('readline-sync');

let componentes = []

for (i = 0; i < 3; i++) {
    const nome = entrada.question("Informe o nome do componente: ")
    const quantidade = entrada.questionInt("Informe a quantidade deste componente em estoque: ")
    const estoqueMinimo = entrada.questionInt("Informe qual e o estoque minimo deste componente: ")

    const cadastroComponentes = {
        nome : nome,
        quantidade : quantidade,
        estoqueMinimo : estoqueMinimo
    }
    componentes.push(cadastroComponentes)
}
for (i = 0; i < componentes.length; i++) {
    if (componentes[i], estoqueMinimo > quantidade) {
        console.log(`O Componente ${i} (${componentes[i]}) precisa repor seu estoque`);
    }else{
        console.log(`O Componente ${i} (${componentes[i]}) esta com o estoque ok`);
    }
}