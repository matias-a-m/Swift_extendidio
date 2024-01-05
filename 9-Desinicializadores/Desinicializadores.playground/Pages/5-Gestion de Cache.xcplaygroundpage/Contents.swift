//: [Previous](@previous)

import Foundation

class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("\(name) has been initialized.")
    }

    deinit {
        print("\(name) has been deinitialized.")
    }
}

class Apartment {
    let unit: String
    weak var tenant: Person?

    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) has been initialized.")
    }

    deinit {
        print("Apartment \(unit) has been deinitialized.")
    }
}

// Crear instancias de Person y Apartment
var john: Person? = Person(name: "John")
var unit4A: Apartment? = Apartment(unit: "4A")

// Asignar referencias fuertes entre los objetos, creando un ciclo de retención fuerte
john?.apartment = unit4A
unit4A?.tenant = john

// Imprimir el estado antes de liberar las referencias
print("Before setting to nil:")
print("John: \(john)")
print("Apartment: \(unit4A)")

// Liberar las referencias a las instancias (estableciéndolas en nil)
john = nil
unit4A = nil

// Imprimir el estado después de liberar las referencias
print("After setting to nil:")
print("John: \(john)")
print("Apartment: \(unit4A)")


