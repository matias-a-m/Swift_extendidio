import Foundation

// Definición de la enumeración OpcionesNotificacion
struct OpcionesNotificacion: OptionSet {
    let rawValue: Int

    static let sonido = OpcionesNotificacion(rawValue: 1 << 0)
    static let vibracion = OpcionesNotificacion(rawValue: 1 << 1)
    static let luz = OpcionesNotificacion(rawValue: 1 << 2)
}

// Función para imprimir la configuración de notificación
func imprimirConfiguracion(tipo: String, configuracion: OpcionesNotificacion) {
    print("Configuración de notificación para \(tipo):")

    if configuracion.contains(.sonido) {
        print("- Sonido activado")
    }

    if configuracion.contains(.vibracion) {
        print("- Vibración activada")
    }

    if configuracion.contains(.luz) {
        print("- Luz activada")
    }

    print("-----")
}

// Uso de la enumeración OpcionesNotificacion en un Playground
var configuracionMensajes: OpcionesNotificacion = [.sonido]
imprimirConfiguracion(tipo: "Mensajes", configuracion: configuracionMensajes)

var configuracionRecordatorios: OpcionesNotificacion = [.sonido, .vibracion]
imprimirConfiguracion(tipo: "Recordatorios", configuracion: configuracionRecordatorios)

var configuracionEventos: OpcionesNotificacion = [.luz]
imprimirConfiguracion(tipo: "Eventos", configuracion: configuracionEventos)
