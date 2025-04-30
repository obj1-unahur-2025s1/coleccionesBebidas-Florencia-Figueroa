object tito {
    var cantidad = 0
    var bebida = cianuro
    const peso = 70
    const inerciaBase = 490
    
    method bebida() = bebida
    method peso() = peso

    method velocidad() {
        return bebida.rendimiento(cantidad) * inerciaBase / peso
    }
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
}

object licuado {
    const nutrientes = []

    method rendimiento(cantidad) = nutrientes.sum() * cantidad
    method agregar(nutriente){
        nutrientes.add(nutriente)} 
}

object aguaSaborizada {
    var bebida = terere
    method bebida(nueva){bebida = nueva}
    method rendimiento(cantidad) = 1 + bebida.rendimiento(cantidad) /4
}

object coctelDeBebidas {
  const bebidas = [wisky, terere]
  method rendimiento(cantidad) = bebidas.sum({b => b.rendimiento(cantidad)})
}

object coctelSuave {
    const bebidas = [wisky, terere]

    method agregar(bebida){bebidas.add(bebida)}
    method quitar(bebida){bebidas.remove(bebida)}
    method rendimiento(cantidad){
        const bebidasAConsiderar = 
            bebidas.filter({b => b.rendimiento(cantidad) > 0.5}) //lista con las bebidas a poner
        return bebidasAConsiderar.sum({b => b.rendimiento(cantidad)})
    }

// OTRA FORMA DE HACER EL RENDIMIENTO
//  method rendimientoBis(cantidad)=
//      bebidas.filter({b => b.rendimiento(cantidad > 0.5)}.sum({b => b.rendimiento(cantidad)}))
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
    }
}