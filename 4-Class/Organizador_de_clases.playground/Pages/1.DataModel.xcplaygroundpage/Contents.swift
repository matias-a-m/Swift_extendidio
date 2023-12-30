// Definición de la clase Producto
class Producto {
    // Propiedades de la clase Producto
    var nombre: String
    var precio: Double

    // Inicializador (constructor) de la clase Producto
    init(nombre: String, precio: Double) {
        // Inicialización de las propiedades con los valores proporcionados
        self.nombre = nombre
        self.precio = precio
    }
}

// Creación de una instancia de la clase Producto llamada iPhone
let iPhone = Producto(nombre: "iPhone 13", precio: 999.99)
