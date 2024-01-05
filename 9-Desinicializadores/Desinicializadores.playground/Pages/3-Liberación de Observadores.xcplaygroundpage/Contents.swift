//: [Previous](@previous)

import Foundation

class MyClass {
    var observer: NSObjectProtocol?

    // Inicializador de la clase
    init() {
        // Configurar el observador de notificaciones aquí
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name("MiNotificacion"), object: nil, queue: nil) { _ in
            // Manejar la notificación recibida
            print("Notificación recibida")
        }
    }

    // Método para simular operaciones con la instancia
    func simulateUsage() {
        // Simular una operación que dispara una notificación
        NotificationCenter.default.post(name: NSNotification.Name("MiNotificacion"), object: nil)
    }
}

// Crear una instancia de MyClass
var myObject: MyClass? = MyClass()

// Simular el uso de la instancia
myObject?.simulateUsage()

// Simular la liberación de la instancia (similar a establecer la referencia a nil)
withExtendedLifetime(myObject) {
    // No se requiere ninguna acción aquí, ya que withExtendedLifetime mantiene viva la instancia durante este bloque
}

// En un caso real de desarrollo, este código podría representar la configuración de algún objeto que escucha notificaciones,
// realiza ciertas acciones cuando se recibe una notificación y luego se libera adecuadamente para evitar posibles fugas de memoria.


//: [Next](@next)
