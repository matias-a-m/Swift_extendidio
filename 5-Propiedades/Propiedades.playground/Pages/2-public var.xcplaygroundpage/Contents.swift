// Importar el módulo NetworkingModule
import NetworkingModule

// File: Networking.swift (en un módulo llamado NetworkingModule)

// Definición de la estructura APIClient
public struct APIClient {
    // Variable pública para almacenar la URL base de la API
    // La palabra clave 'public' indica que esta variable es accesible desde cualquier otro módulo que importe NetworkingModule.
    public static var baseURL: String = "https://api.example.com"
    
    // Función pública para obtener datos de la API
    // La palabra clave 'public' indica que esta función es accesible desde cualquier otro módulo que importe NetworkingModule.
    public static func fetchData() {
        // Construir la URL completa utilizando la variable baseURL
        let fullURL = baseURL + "/dataEndpoint"
        
        // Lógica para realizar la solicitud de datos a la API
        // (Esta es una simulación, puedes agregar la lógica real según tus necesidades)
        print("Fetching data from: \(fullURL)")
        
        // Aquí podrías utilizar URLSession u otra lógica para obtener los datos reales
    }
}

// Acceder y modificar la variable pública
// En este caso, estamos cambiando la URL base de la API a otra dirección.
APIClient.baseURL = "https://api.anotherexample.com"

// Llamar a la función pública para obtener datos
APIClient.fetchData()
