import Foundation

struct Message {
    var content: String
    var sender: String
    var timestamp: Date
    private var isRead: Bool
    
    init(content: String, sender: String) {
        self.content = content
        self.sender = sender
        self.timestamp = Date()
        self.isRead = false
    }
    
    // Subscripting para acceder y modificar atributos genéricos
    subscript(key: String) -> Any? {
        get {
            switch key {
            case "content":
                return content
            case "sender":
                return sender
            case "timestamp":
                return timestamp
            case "isRead":
                return isRead
            default:
                return nil
            }
        }
        set {
            guard let newValue = newValue else { return }
            switch key {
            case "content":
                if let newContent = newValue as? String {
                    content = newContent
                }
            case "sender":
                if let newSender = newValue as? String {
                    sender = newSender
                }
            case "timestamp":
                if let newTimestamp = newValue as? Date {
                    timestamp = newTimestamp
                }
            case "isRead":
                if let newIsRead = newValue as? Bool {
                    isRead = newIsRead
                }
            default:
                break
            }
        }
    }
    
    // Método para marcar el mensaje como leído
    mutating func markAsRead() {
        isRead = true
    }
    
    // Método para enviar el mensaje
    func send() {
        // Lógica para enviar el mensaje (puede implicar el uso de una red o almacenamiento local)
        print("Mensaje enviado: '\(content)' de \(sender) a las \(timestamp)")
    }
}

// Crear una instancia de la estructura Message
var message = Message(content: "¡Hola!", sender: "Alice")

// Acceder y modificar atributos genéricos mediante subscripting
print("Contenido: \(message["content"] as? String ?? "N/A")")  // Imprime "Contenido: ¡Hola!"
print("Remitente: \(message["sender"] as? String ?? "N/A")")    // Imprime "Remitente: Alice"
print("Leído: \(message["isRead"] as? Bool ?? false)")          // Imprime "Leído: false"

// Marcar el mensaje como leído mediante método
message.markAsRead()

// Imprimir estado de lectura actualizado
print("Leído: \(message["isRead"] as? Bool ?? false)")          // Imprime "Leído: true"

// Enviar el mensaje mediante método
message.send()
