struct Person {
    var name: String
    var age: Int
    
    // Método no mutante
    func description() -> String {
        return "\(name), \(age) años"
    }
    
    // Método mutante que actualiza la edad de la persona
    mutating func celebrateBirthday() {
        age += 1
    }
}

// Crear una instancia de la estructura
var person1 = Person(name: "Juan", age: 30)

// Llamar al método no mutante
let personDescriptionBeforeBirthday = person1.description()
print("Antes del cumpleaños: \(personDescriptionBeforeBirthday)")

// Llamar al método mutante
person1.celebrateBirthday()
print("Después del cumpleaños: \(person1.description())")
