function calcularKwh (potencia, horas) {

    return (potencia * horas) / 1000

}

function calcularCusto (totalKwh, precoKwh) {

    return totalKwh * precoKwh

}

function classificarConsumo (totalKwh) {

    if(totalKwh < 100) {
        return"Consumo baixo"
    }else{
        return "Consumo elevado"
    }

}

module.exports = {

    calcularKwh,
    calcularCusto,
    classificarConsumo

}