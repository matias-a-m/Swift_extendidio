import Foundation

// Definición de la enumeración EstadoAutenticacion
enum EstadoAutenticacion {
    case noAutenticado
    case enProceso
    case autenticado(usuario: String, esAdmin: Bool)
    case error(mensaje: String)
}

// Definición de un resultado de autenticación (éxito o error)
enum ResultadoAutenticacion {
    case exitoso(usuario: String, esAdmin: Bool)
    case error(mensaje: String)
}

// Función para simular el proceso de autenticación
func autenticarUsuario(nombreUsuario: String, contraseña: String, completion: @escaping (ResultadoAutenticacion) -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        // Simulamos una autenticación exitosa en este ejemplo
        if nombreUsuario == "admin" && contraseña == "adminpass" {
            completion(.exitoso(usuario: "Admin", esAdmin: true))
        } else if nombreUsuario == "usuario123" && contraseña == "contrasena123" {
            completion(.exitoso(usuario: "Usuario123", esAdmin: false))
        } else {
            // Simulamos un error si las credenciales son incorrectas
            completion(.error(mensaje: "Credenciales incorrectas"))
        }
    }
}

// Función para manejar el estado de la autenticación
func manejarEstadoAutenticacion(_ estado: EstadoAutenticacion) {
    switch estado {
    case .noAutenticado:
        print("Estado: No autenticado")
    case .enProceso:
        print("Estado: En proceso de autenticación...")
    case .autenticado(let usuario, let esAdmin):
        if esAdmin {
            print("Estado: Autenticado como administrador - Usuario: \(usuario)")
        } else {
            print("Estado: Autenticado como usuario normal - Usuario: \(usuario)")
        }
    case .error(let mensaje):
        print("Estado: Error de autenticación - \(mensaje)")
    }
}

// Uso de la función de autenticación en un Playground
var estadoActualAutenticacion: EstadoAutenticacion = .noAutenticado

// Intentamos autenticar al usuario administrador después de 3 segundos
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    autenticarUsuario(nombreUsuario: "admin", contraseña: "adminpass") { resultado in
        switch resultado {
        case .exitoso(let usuario, let esAdmin):
            estadoActualAutenticacion = .autenticado(usuario: usuario, esAdmin: esAdmin)
        case .error(let mensaje):
            estadoActualAutenticacion = .error(mensaje: mensaje)
        default:
            break
        }
        manejarEstadoAutenticacion(estadoActualAutenticacion)
    }
}
