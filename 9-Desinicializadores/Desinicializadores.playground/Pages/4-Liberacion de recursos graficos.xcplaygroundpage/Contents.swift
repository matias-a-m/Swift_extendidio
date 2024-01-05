//: [Previous](@previous)

import UIKit

// Definición de la clase Usuario
class Usuario {
    var nombre: String
    var imagenPerfil: UIImage?

    // Inicializador que asigna valores al nombre y a la imagen de perfil
    init(nombre: String, imagenPerfil: UIImage? = nil) {
        self.nombre = nombre
        self.imagenPerfil = imagenPerfil
        // Imprimir un mensaje al crear un nuevo Usuario
        print("Usuario \(nombre) creado.")
    }

    // Destructor que se ejecuta cuando el objeto es desasignado
    deinit {
        // Imprimir un mensaje al desasignar el Usuario, indicando que se han liberado recursos
        print("Usuario \(nombre) ha sido desasignado. Recursos liberados.")
    }
}

// Crear una instancia de Usuario en el Playground
var usuario1: Usuario? = Usuario(nombre: "Juan", imagenPerfil: UIImage(named: "perfil1"))

// Realizar operaciones con la instancia...
print("Nombre del usuario: \(usuario1?.nombre ?? "Sin nombre")")

// Cuando ya no se necesite la instancia, se desasignará y se llamará a deinit
usuario1 = nil


//: [Next](@next)
