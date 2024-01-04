//: [Previous](@previous)
class Persona {
    var nombre: String
    
    init(nombre: String) {
        self.nombre = nombre
    }
}

// Creamos un puntero opcional a una instancia de Persona
var personaOptional: Persona? = Persona(nombre: "Juan")

// Desreferenciamos el puntero opcional usando if let
if let personaDesreferenciada = personaOptional {
    print("La persona se llama \(personaDesreferenciada.nombre)")
} else {
    print("El puntero opcional es nil.")
}

// Intentamos desreferenciar directamente (sin enlace opcional)
// Esto puede resultar en un error si el puntero opcional es nil
// Descomenta la línea siguiente para ver el resultado
// print("La persona se llama \(personaOptional!.nombre)")




