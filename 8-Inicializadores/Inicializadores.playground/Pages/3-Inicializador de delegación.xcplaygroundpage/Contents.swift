//: [Previous](@previous)
class Cliente {
    var nombre: String
    var direccion: String

    init(nombre: String, direccion: String) {
        self.nombre = nombre
        self.direccion = direccion
    }
}

class Pedido {
    var numeroPedido: Int
    var cliente: Cliente

    // Inicializador de delegación
    init(numeroPedido: Int, cliente: Cliente) {
        self.numeroPedido = numeroPedido
        self.cliente = cliente
    }

    // Otro inicializador conveniente que toma solo el nombre del cliente y asigna una dirección predeterminada
    convenience init(numeroPedido: Int, nombreCliente: String) {
        let clientePredeterminado = Cliente(nombre: nombreCliente, direccion: "Dirección Predeterminada")
        self.init(numeroPedido: numeroPedido, cliente: clientePredeterminado)
    }
}

// Uso de la inicialización de delegación
let clienteExistente = Cliente(nombre: "Juan Pérez", direccion: "123 Calle Principal")
let pedidoExistente = Pedido(numeroPedido: 1, cliente: clienteExistente)

print("Número de Pedido: \(pedidoExistente.numeroPedido)")
print("Nombre del Cliente: \(pedidoExistente.cliente.nombre)")
print("Dirección del Cliente: \(pedidoExistente.cliente.direccion)")

// Uso del inicializador conveniente
let pedidoNuevo = Pedido(numeroPedido: 2, nombreCliente: "María García")

print("Número de Pedido: \(pedidoNuevo.numeroPedido)")
print("Nombre del Cliente: \(pedidoNuevo.cliente.nombre)")
print("Dirección del Cliente: \(pedidoNuevo.cliente.direccion)")

//: [Next](@next)
