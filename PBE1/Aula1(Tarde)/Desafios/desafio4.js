const entrada = require('readline-sync'); 

const nome = entrada.question("Seu nome: ")
const idade = entrada.questionInt("Sua idade: ")

if (idade >= 5 && idade <=10){
    console.log(`${nome} Sua classificação é Infantil`)
}else if (idade > 10 && idade <=18){
    console.log(`${nome} Sua classificação é Juvenil`)
}else if (idade > 18 && idade <=60){
    console.log(`${nome} Sua classificação é Adulto`)
}else if (idade > 60){
    console.log(`${nome} Sua classificação é Sênior`)
}else{
    console.log(`${nome} Você não pode ser classificado`)
}