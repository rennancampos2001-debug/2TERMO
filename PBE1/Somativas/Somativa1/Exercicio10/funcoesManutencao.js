function calcularMaoDeObra (horas) {
    return 80 * horas
}

function calcularTotal (valorPecas, hora) {
    valorPecas + hora
}

function verificarGarantia (meses) {
    if (meses <= 6) {
        return "Em Garantia"
    }else{
        return "Fora de Garantia"
    }
}

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
};