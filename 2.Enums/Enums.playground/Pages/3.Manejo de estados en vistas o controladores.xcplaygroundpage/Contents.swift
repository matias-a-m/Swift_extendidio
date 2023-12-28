import Foundation

// Modelo de datos
struct ModeloDeDatos {
    var nombre: String
    var edad: Int
}

// Definición de la enumeración ViewState
enum EstadoVista {
    case cargando
    case mostrandoDatos(ModeloDeDatos)
    case error(mensaje: String)
}

// Definición de un resultado de carga (éxito o fracaso)
enum ResultadoCarga {
    case exito(datos: ModeloDeDatos)
    case fracaso(mensaje: String)
}

// Definición de la clase ViewController
class ViewController {
    var estadoVistaActual: EstadoVista = .cargando

    // Función para simular la carga de datos desde una fuente externa
    func cargarDatos(completion: @escaping (ResultadoCarga) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Simulación de carga exitosa de datos en este ejemplo
            let datosCargados = ModeloDeDatos(nombre: "John Doe", edad: 30)
            completion(.exito(datos: datosCargados))
            
            // También podríamos simular un error descomentando la siguiente línea:
            // let mensajeError = "Error cargando datos"
            // completion(.fracaso(mensaje: mensajeError))
        }
    }

    // Función para manejar el estado de la vista
    func manejarEstadoVista(_ nuevoEstado: EstadoVista) {
        print("Transición de estado:")
        print("De \(estadoVistaActual) a \(nuevoEstado)")
        estadoVistaActual = nuevoEstado
        animarCambioDeEstado()
    }

    // Función para animar cambios en el estado de la vista (simulado)
    func animarCambioDeEstado() {
        print("Animación: Cambio de estado animado")
    }
}



// Uso de la clase ViewController en un Playground
let controladorVista = ViewController()

// Simulación de carga de datos después de 3 segundos
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    controladorVista.cargarDatos { resultado in
        switch resultado {
        case .exito(let datos):
            controladorVista.manejarEstadoVista(.mostrandoDatos(datos))
        case .fracaso(let mensaje):
            controladorVista.manejarEstadoVista(.error(mensaje: mensaje))
        }
    }
}
