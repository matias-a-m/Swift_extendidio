import UIKit

// Clase base para todos los tipos de mensajes
class Mensaje {
    var contenido: String
    var remitente: String
    var fechaEnvio: Date
    
    init(contenido: String, remitente: String, fechaEnvio: Date) {
        self.contenido = contenido
        self.remitente = remitente
        self.fechaEnvio = fechaEnvio
    }
    
    func mostrarMensaje() {
        print("\(remitente) dijo: \(contenido)")
    }
}

// Subclase para mensajes de texto
class MensajeTexto: Mensaje {
    var emoticon: String?
    
    init(contenido: String, remitente: String, fechaEnvio: Date, emoticon: String?) {
        self.emoticon = emoticon
        super.init(contenido: contenido, remitente: remitente, fechaEnvio: fechaEnvio)
    }
    
    override func mostrarMensaje() {
        if let emoticon = emoticon {
            print("\(remitente) dijo: \(contenido) \(emoticon)")
        } else {
            super.mostrarMensaje()
        }
    }
}

// Subclase para mensajes de imagen
class MensajeImagen: Mensaje {
    var imagen: UIImage
    
    init(imagen: UIImage, remitente: String, fechaEnvio: Date) {
        self.imagen = imagen
        super.init(contenido: "Imagen adjunta", remitente: remitente, fechaEnvio: fechaEnvio)
    }
    
    override func mostrarMensaje() {
        print("\(remitente) envió una imagen")
    }
}

// Uso de las clases en una aplicación ficticia de mensajes
let mensajeTexto = MensajeTexto(contenido: "Hola, ¿cómo estás?", remitente: "UsuarioA", fechaEnvio: Date(), emoticon: "😊")
let mensajeImagen = MensajeImagen(imagen: UIImage(named: "user_photo.jpg")!, remitente: "UsuarioB", fechaEnvio: Date())

mensajeTexto.mostrarMensaje()
mensajeImagen.mostrarMensaje()
