const entrada = require('readline-sync');

const temperatura = entrada.questionInt('Informe a temperatura da maquina: ');

if (temperatura <= 60) {
    console.log(`Sua maquina esta NORMAL com a temperatura de ${temperatura}°C`);
}else if (temperatura > 60 & temperatura <= 80) {
    console.log(`Sua maquina precisa de ATENCAO pois sua temperatura esta em ${temperatura}°C`);
}else{
    console.log(`SUa maquina esta em situacao CRITICA com a temperatura em ${temperatura}°C`);
}