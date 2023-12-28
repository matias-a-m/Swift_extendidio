import Foundation

// Enum que representa los posibles errores
enum MiError: Error {
    case errorRed
    case errorDatosInvalidos
}

// Función que puede lanzar errores representados por el enum
func procesarDatos(datos: String) throws {
    guard datos.count > 0 else {
        throw MiError.errorDatosInvalidos
    }

    // Simulación de un problema de red
    let hayProblemaDeRed = true
    if hayProblemaDeRed {
        throw MiError.errorRed
    }

    // Procesar datos aquí...
    print("Datos procesados con éxito: \(datos)")
}

// Uso de la función en un bloque do-catch
do {
    try procesarDatos(datos: "Información importante")
} catch MiError.errorRed {
    print("Error de red. Verifica tu conexión.")
} catch MiError.errorDatosInvalidos {
    print("Error: Los datos proporcionados no son válidos.")
} catch {
    print("Se ha producido un error desconocido.")
}
