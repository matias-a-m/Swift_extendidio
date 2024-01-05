import Foundation
import PlaygroundSupport

class ImageHandler {
    let inputImageURL: URL
    let outputImageURL: URL

    init(imageFileName: String) {
        // Obtiene la URL del archivo de imagen de entrada
        inputImageURL = Bundle.main.url(forResource: imageFileName, withExtension: nil)!
        
        // Crea la URL del archivo de imagen de salida en el directorio de documentos del playground
        outputImageURL = playgroundSharedDataDirectory.appendingPathComponent("output_image.jpg")

        // Copia la imagen de entrada a la ubicación de salida como ejemplo
        try? FileManager.default.copyItem(at: inputImageURL, to: outputImageURL)
    }

    deinit {
        // Aquí podrías realizar acciones de limpieza si es necesario
        print("Manejador de imagen desinicializado.")
    }
}

// Uso de la clase en el Playground
var imageHandler: ImageHandler? = ImageHandler(imageFileName: "user_photo.jpg")

// Observa la consola del Playground para ver la salida cuando se desinicializa el objeto

// Al finalizar, la desinicialización de la instancia llamará al método deinit
imageHandler = nil

// Mantén el Playground en ejecución para ver la salida en la consola
PlaygroundPage.current.needsIndefiniteExecution = true


//: [Next](@next)
