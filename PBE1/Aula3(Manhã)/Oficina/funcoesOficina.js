function calcularOrcamento(precoPeca, horasTrabalho) {

    const valorHora = 85.00
    const totalMaoDeObra = horasTrabalho * valorHora
    return precoPeca + totalMaoDeObra

}

function calcularDesconto(valor) {

    return valor * 0.95

}

function verificarGarantia(meses) {

    if (meses <= 3) {
        return "Dentro de Garantia"
    }else {
        return "Garantia Expirada"
    }

}

module.exports = {

    calcularOrcamento,
    verificarGarantia,
    calcularDesconto

}