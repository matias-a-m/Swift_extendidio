import Foundation


// Arrayx
func makeArrayModifier() -> () -> [Int] {
    var numbers = [1, 2, 3]

    let arrayModifier: () -> [Int] = {
        numbers.append(4)
        return numbers
    }

    return arrayModifier
}

let modifyArray = makeArrayModifier()
print("ARRAY: \(modifyArray())")  // Output: [1, 2, 3, 4]


// Tipos de datos personalizados

struct Person {
    var name: String
    var age: Int
}

func makePersonUpdater() -> (Int) -> Person {
    var person = Person(name: "John", age: 30)

    let personUpdater: (Int) -> Person = { newAge in
        person.age = newAge
        return person
    }

    return personUpdater
}

let updatePerson = makePersonUpdater()
let updatedPerson = updatePerson(35)
print("TIPO DE DATO PERSONALIZADO: \(updatedPerson)")  // Output: Person(name: "John", age: 35)



// Cadenas de texto
func makeStringReverser() -> (String) -> String {
    var reversedString = ""

    let stringReverser: (String) -> String = { input in
        reversedString = String(input.reversed())
        return reversedString
    }

    return stringReverser
}

let reverseString = makeStringReverser()
let reversed = reverseString("Swift")
print("STRINGS: \(reversed)")  // Output: "tfiwS"


// Tipos de datos opcionales

func makeOptionalChecker() -> (Int?) -> Bool {
    print("OPCIONALES:")
    let optionalChecker: (Int?) -> Bool = { number in
       
        if let value = number {
            print("- Número proporcionado: \(value)")
            return true
        } else {
            print("- Ningún número proporcionado.")
            return false
        }
    }

    return optionalChecker
}

let checkOptional = makeOptionalChecker()
_ = checkOptional(42)    // Output: "Número proporcionado: 42"
_ = checkOptional(nil)   // Output: "Ningún número proporcionado."

