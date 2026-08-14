const entrada = require('readline-sync');
const idade = entrada.questionInt('Digite sua idade ? ');

if (idade >= 18) {
    console.log('Acesso liberado! Divirta-se.');
} else {
    console.log('Acesso negado. Vá para casa estudadar Node.js!');
}