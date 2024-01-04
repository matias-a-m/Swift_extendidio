//: [Previous](@previous)
import Foundation

class Libro {
    var titulo: String
    var autor: String
    var fechaPublicacion: Date
    var numeroPaginas: Int

    // Inicializador designado
    init(titulo: String, autor: String, fechaPublicacion: Date, numeroPaginas: Int) {
        self.titulo = titulo
        self.autor = autor
        self.fechaPublicacion = fechaPublicacion
        self.numeroPaginas = numeroPaginas
    }

    // Inicializador de conveniencia
    convenience init(titulo: String, autor: String) {
        // Establecer valores predeterminados para fecha de publicación y número de páginas
        let fechaActual = Date()
        let paginasPredeterminadas = 200

        // Llamamos al inicializador designado con los valores predeterminados
        self.init(titulo: titulo, autor: autor, fechaPublicacion: fechaActual, numeroPaginas: paginasPredeterminadas)
    }
}

// Uso de los inicializadores
let libroCompleto = Libro(titulo: "El Gran Libro", autor: "Autor Famoso", fechaPublicacion: Date(), numeroPaginas: 300)
let libroSimple = Libro(titulo: "Libro Sencillo", autor: "Otro Autor")

print(libroCompleto.fechaPublicacion) // Fecha actual
print(libroSimple.fechaPublicacion)   // Fecha actual (establecida por el inicializador de conveniencia)

//: [Next](@next)
