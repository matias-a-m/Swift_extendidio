// File: DataManager.swift

// Definición de la estructura DataManager
struct DataManager {
    // Variable interna para almacenar datos de tipo String
    // La palabra clave 'internal' indica que esta variable es accesible dentro del módulo en el que se encuentra la estructura.
    internal var data: [String] = []

    // Método para procesar los datos almacenados
    func processData() {
        // Lógica para procesar los datos
        // (Por ejemplo, imprimir los datos almacenados)
        print("Datos almacenados: \(data)")
    }
}

// Creación de una instancia de DataManager
var dataManager = DataManager()

// Agregar algunos datos a la variable interna "data"
dataManager.data.append("Dato 1")
dataManager.data.append("Dato 2")
dataManager.data.append("Dato 3")

// Llamar al método processData para procesar los datos
dataManager.processData()
