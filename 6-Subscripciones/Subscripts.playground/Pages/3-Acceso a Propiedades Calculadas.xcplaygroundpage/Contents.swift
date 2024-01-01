struct MiStructura {
    var valores: [Int]

    // Subscript que permite acceder a elementos de la colección
    subscript(index: Int) -> Int {
        get {
            return valores[index]
        }
        set(newValue) {
            valores[index] = newValue
        }
    }

    // Propiedad calculada que devuelve la suma de todos los elementos
    var sumaDeValores: Int {
        return valores.reduce(0, +)
    }
}

// Crear una instancia de la estructura
var miInstancia = MiStructura(valores: [1, 2, 3, 4, 5])

// Acceder a través del subscript y modificar un valor
print(miInstancia[2]) // Imprimirá 3

miInstancia[2] = 10
print(miInstancia[2]) // Imprimirá 10

// Acceder a la propiedad calculada
print(miInstancia.sumaDeValores) // Imprimirá 22
