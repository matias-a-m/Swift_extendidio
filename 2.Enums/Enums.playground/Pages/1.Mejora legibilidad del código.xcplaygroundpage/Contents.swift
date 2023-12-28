import Foundation

enum EstadoPedido {
    case pendiente
    case enProceso(ubicacionRepartidor: Coordenadas)
    case entregado(fechaEntrega: Date)
    case cancelado(motivo: String)
}

struct Coordenadas {
    let latitud: Double
    let longitud: Double
}

let estadoPendiente: EstadoPedido = .pendiente
let estadoEnProceso: EstadoPedido = .enProceso(ubicacionRepartidor: Coordenadas(latitud: 37.7749, longitud: -122.4194))
let estadoentregado: EstadoPedido = .entregado(fechaEntrega: Date())
let estadoCancelado: EstadoPedido = .cancelado(motivo: "no se cuencutra en casa")
