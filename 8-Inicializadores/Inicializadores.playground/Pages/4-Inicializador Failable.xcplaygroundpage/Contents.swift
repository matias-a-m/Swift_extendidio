//: [Previous](@previous)
import MessageUI

struct Mensaje {
    let destinatario: String
    let contenido: String
    
    // Inicializador failable
    init?(destinatario: String, contenido: String) {
        guard MFMessageComposeViewController.canSendText() else {
            // Verificar si el dispositivo puede enviar mensajes
            print("El dispositivo no puede enviar mensajes.")
            return nil
        }
        
        guard !destinatario.isEmpty else {
            // Verificar si el destinatario está vacío
            print("El destinatario no puede estar vacío.")
            return nil
        }
        
        // Si todas las condiciones son válidas, asignar los valores a las propiedades
        self.destinatario = destinatario
        self.contenido = contenido
    }
    
    // Método para enviar el mensaje
    func enviarMensaje() {
        guard let currentScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let viewController = currentScene.windows.first?.rootViewController else {
            print("No se puede obtener el viewController.")
            return
        }

        let mensajeVC = MFMessageComposeViewController()
        mensajeVC.recipients = [destinatario]
        mensajeVC.body = contenido

        viewController.present(mensajeVC, animated: true, completion: nil)
    }
}

// Uso del inicializador failable y envío del mensaje
if let mensaje = Mensaje(destinatario: "123456789", contenido: "Hola desde mi app") {
    mensaje.enviarMensaje()
} else {
    print("No se pudo crear el mensaje debido a valores no válidos.")
}


//: [Next](@next)
