import UIKit

// Definición de la clase BaseViewController
open class BaseViewController: UIViewController {
    // Propiedad titleText con la palabra clave 'open'
    open var titleText: String = ""

    // Método updateUI con la palabra clave 'open'
    open func updateUI() {
        // Imprime un mensaje indicando que la interfaz de usuario se está actualizando
        print("BaseViewController - Actualizando interfaz de usuario")
    }
}

// Clase derivada de BaseViewController
class CustomViewController: BaseViewController {
    // Sobrescribimos el método updateUI para personalizar la lógica
    override func updateUI() {
        // Llamamos al método de la clase base para asegurarnos de que se realice la lógica original
        super.updateUI()
        
        // Personalizamos la lógica para esta clase derivada
        titleText = "¡Interfaz actualizada en CustomViewController!"
        // Imprime el nuevo mensaje personalizado
        print(titleText)
    }
}

// Uso en Playground
let baseVC = BaseViewController()
// Llama al método updateUI de BaseViewController
baseVC.updateUI()

let customVC = CustomViewController()
// Llama al método updateUI de CustomViewController, que a su vez llama al método de la clase base y personaliza la propiedad titleText
customVC.updateUI()
