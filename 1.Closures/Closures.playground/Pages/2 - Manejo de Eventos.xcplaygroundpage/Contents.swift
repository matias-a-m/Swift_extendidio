import UIKit
import PlaygroundSupport

// Los closures son útiles para manejar eventos, como acciones de botones, cambios en controles deslizantes o teclas de teclado. Puedes definir el comportamiento que se ejecutará cuando ocurra un evento específico.

class MyViewController: UIViewController {
    
    // Etiqueta para mostrar el mensaje
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 50, width: 200, height: 40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creamos una vista de botón
        let button = UIButton(type: .system)
        button.setTitle("Presionar", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
        // Definimos un closure que se ejecutará cuando el botón sea presionado
        let buttonHandler: () -> Void = {
            // Actualizamos el texto de la etiqueta al presionar el botón
            self.label.text = "¡Botón presionado!"
        }
        
        // Asociamos el closure al evento TouchUpInside del botón
        button.addTarget(nil, action: #selector(buttonHandler), for: .touchUpInside)
        
        // Creamos una vista contenedora para el botón y la etiqueta
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        containerView.addSubview(button)
        containerView.addSubview(label)
        
        // Asignamos la vista contenedora a la vista del controlador
        self.view = containerView
    }
}

