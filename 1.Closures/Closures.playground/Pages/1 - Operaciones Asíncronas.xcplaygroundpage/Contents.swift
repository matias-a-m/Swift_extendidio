import Foundation
import PlaygroundSupport

// Los closures son comúnmente utilizados en operaciones asíncronas, como solicitudes de red o procesos que llevan tiempo. Por ejemplo, al realizar una llamada de red, puedes pasar un closure que se ejecute una vez que la operación se complete.

// Definición de la estructura para representar el JSON
struct Person: Codable {
    let name: String
    let age: Int
    let address: String
}

// Definición de un typealias para el closure que manejará el resultado
typealias CompletionHandler = (Result<Person, Error>) -> Void

class NetworkManager {
    
    // Método que simula una solicitud de red asíncrona con datos JSON
    static func fetchData(completion: @escaping CompletionHandler) {
        // Simulamos una tarea asíncrona, como una solicitud de red
        DispatchQueue.global().async {
            // Supongamos que realizamos una solicitud de red y obtenemos una respuesta
            let success = Bool.random() // Simulamos si la solicitud fue exitosa o no
            
            // Simulamos un tiempo de espera
            sleep(2)
            
            // Manejamos el resultado utilizando el closure
            if success {
                // Creamos una instancia de la estructura Person con datos simulados
                let person = Person(name: "John Doe", age: 30, address: "123 Main St")
                completion(.success(person))
            } else {
                let error = NSError(domain: "com.example.network", code: 100, userInfo: nil)
                completion(.failure(error))
            }
        }
    }
}

// Uso del NetworkManager para realizar una solicitud de red
NetworkManager.fetchData { result in
    switch result {
    case .success(let person):
        // Utilizamos el objeto JSON simulado
        print("Solicitud exitosa. Datos obtenidos: \(person)")
    case .failure(let error):
        print("Error en la solicitud: \(error.localizedDescription)")
    }
}

// Necesario para mantener el playground en ejecución hasta que la tarea asíncrona se complete
PlaygroundPage.current.needsIndefiniteExecution = true
