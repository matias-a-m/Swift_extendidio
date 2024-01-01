// Definición de la estructura base
struct Animal {
    var name: String
    var age: Int
    var isFriendly: Bool  // Agrega la propiedad isFriendly en la estructura Animal

    func makeSound() {
        print("Some generic animal sound")
    }
}

// Herencia de estructuras mediante protocolos y extensiones
protocol Pet {
    func play()
}

extension Animal: Pet {
    func play() {
        print("\(name) is playing")
    }
}

// Creación de una instancia de Animal
var myPet = Animal(name: "Buddy", age: 3, isFriendly: true)

// Acceso a las propiedades y métodos de la estructura base
print("Name: \(myPet.name)")
print("Age: \(myPet.age)")
myPet.makeSound()

// Acceso a las propiedades y métodos heredados a través del protocolo
myPet.play()
