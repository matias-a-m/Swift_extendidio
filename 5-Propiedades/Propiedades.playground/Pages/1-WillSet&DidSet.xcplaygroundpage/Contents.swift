// Validación de entrada

class User {
    var username: String = "" {
        willSet(newUsername) {
            if newUsername.isEmpty {
                print("Advertencia: El nombre de usuario no debe estar vacío.")
            }
        }
        didSet {
            print("Nombre de usuario actualizado: \(username)")
        }
    }
}

let newUser = User()
newUser.username = "JohnDoe" // Nombre de usuario actualizado: JohnDoe
newUser.username = ""        // Advertencia: El nombre de usuario no debe estar vacío.
                             // Nombre de usuario actualizado: JohnDoe


// Registro de cambios
struct Temperature {
    var celsius: Double = 0.0 {
        didSet {
            print("Temperatura en grados Celsius actualizada a \(celsius)°C")
        }
    }

    var fahrenheit: Double {
        get {
            return celsius * 9/5 + 32
        }
        set {
            celsius = (newValue - 32) * 5/9
        }
    }
}

var currentTemperature = Temperature()
currentTemperature.fahrenheit = 32 // Temperatura en grados Celsius actualizada a 0.0°C


// Acciones en respuesta a cambios
class Account {
    // Propiedad que almacena el saldo de la cuenta
    var balance: Double = 0.0 {
        didSet {
            // Cuando el saldo cambia, se ejecuta este bloque de código
            print("Nuevo saldo de la cuenta: $\(balance)")
            
            // Llamada a la función performActionsOnBalanceChange para realizar acciones específicas
            performActionsOnBalanceChange()
        }
    }

    // Función que realiza acciones en respuesta a cambios en el saldo
    func performActionsOnBalanceChange() {
        // Verifica si el saldo es negativo
        if balance < 0.0 {
            // Si el saldo es negativo, muestra una alerta
            print("ALERTA: Saldo negativo. Verifica tus transacciones.")
        } else if balance > 10000.0 {
            // Si el saldo es alto, envía una notificación
            print("¡Felicidades! Has alcanzado un saldo superior a $10,000.")
        } else {
            // Si el saldo está dentro de un rango normal, no hace nada especial
            print("El saldo está en un rango normal.")
        }
    }
}

// Creación de una instancia de Account
let bankAccount = Account()

// Simulación de cambios en el saldo
bankAccount.balance = 500.0       // Nuevo saldo de la cuenta: $500.0
bankAccount.balance = -200.0      // Nuevo saldo de la cuenta: $-200.0
bankAccount.balance = 12000.0     // Nuevo saldo de la cuenta: $12000.0
