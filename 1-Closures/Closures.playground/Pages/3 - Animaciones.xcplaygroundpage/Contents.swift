import UIKit
import PlaygroundSupport

// Cuando realizas animaciones en la interfaz de usuario, los closures son útiles para especificar qué debe suceder al final de una animación. Por ejemplo, cambiar propiedades después de que una animación haya finalizado.

class MyViewController: UIViewController {
    
    let squareView: UIView = {
        let view = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(squareView)
        
        // Animación que mueve el cuadrado hacia la derecha
        UIView.animate(withDuration: 2.0, animations: {
            self.squareView.frame.origin.x += 100
        }) { (_) in
            // Closure que se ejecuta al finalizar la animación
            self.squareView.backgroundColor = UIColor.red
        }
    }
}

