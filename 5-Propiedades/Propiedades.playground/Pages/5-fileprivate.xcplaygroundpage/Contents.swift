// Archivo: EmployeeManager.swift

class EmployeeManager {
    // Propiedad estática para realizar un seguimiento del número total de empleados
    // fileprivate: Limita la visibilidad al ámbito del archivo actual
    // static: La variable es compartida entre todas las instancias de la clase
    fileprivate static var totalEmployees: Int = 0

    // Propiedades de instancia para almacenar detalles individuales del empleado
    var name: String
    var position: String

    // Inicializador de la clase
    init(name: String, position: String) {
        self.name = name
        self.position = position

        // Incrementa el contador de empleados cada vez que se crea una nueva instancia
        EmployeeManager.totalEmployees += 1
    }

    // Método para obtener el número total de empleados
    // fileprivate: Limita la visibilidad al ámbito del archivo actual
    fileprivate static func getTotalEmployees() -> Int {
        return totalEmployees
    }

    // Método para imprimir los detalles del empleado
    func printEmployeeDetails() {
        print("Nombre: \(name), Cargo: \(position)")
    }
}

// Ejemplo de uso en otro archivo

let employee1 = EmployeeManager(name: "Juan", position: "Desarrollador")
employee1.printEmployeeDetails()

let employee2 = EmployeeManager(name: "Maria", position: "Diseñadora")
employee2.printEmployeeDetails()

// Intenta acceder a la propiedad estática desde otro archivo (no compilará)
// let totalEmployees = EmployeeManager.totalEmployees

// Intenta acceder al método estático desde otro archivo (no compilará)
// let totalEmployees = EmployeeManager.getTotalEmployees()
