// Gestion de contactos
class Contacto {
    var nombre: String
    var numeroTelefono: String
    var correoElectronico: String?

    // Inicializador designado
    init(nombre: String, numeroTelefono: String, correoElectronico: String? = nil) {
        self.nombre = nombre
        self.numeroTelefono = numeroTelefono
        self.correoElectronico = correoElectronico
    }

    // Método para imprimir información del contacto
    func imprimirInformacion() {
        print("Nombre: \(nombre)")
        print("Teléfono: \(numeroTelefono)")
        
        if let correo = correoElectronico {
            print("Correo electrónico: \(correo)")
        } else {
            print("Correo electrónico: No especificado")
        }
    }

    // Otros métodos y propiedades de la clase
}

// Uso de la clase Contacto
let nuevoContacto = Contacto(nombre: "Juan Pérez", numeroTelefono: "123-456-7890", correoElectronico: "juan@example.com")

// Imprimir información del contacto
nuevoContacto.imprimirInformacion()


//: [Next](@next)
