import UIKit
import PlaygroundSupport

// Protocolo para el delegado del descargador
protocol DownloaderDelegate: AnyObject {
    func downloadDidFinish(result: Result<UIImage, Error>)
}

class Downloader {
    // Delegado para notificar la finalización de la descarga
    weak var delegate: DownloaderDelegate?
    
    // Closure de completado para ejecutar acciones después de la descarga
    var completionHandler: ((Result<UIImage, Error>) -> Void)?
    
    // Enum para definir errores específicos
    enum DownloadError: Error {
        case imageNotFound
    }
    
    // Método para simular la descarga
    func downloadFile() {
        print("Iniciando la descarga...")
        
        // Simulamos una descarga que toma tiempo
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 2.0)
            
            print("Descarga completa.")
            
            // Simulamos la carga de una imagen desde los recursos del playground
            if let image = UIImage(named: "image.jpg") {
                // Notificamos al delegado que la descarga ha finalizado con éxito
                self.delegate?.downloadDidFinish(result: .success(image))
                
                // Ejecutamos el closure de completado si está definido
                self.completionHandler?(.success(image))
            } else {
                // Si la imagen no se encuentra, lanzamos un error
                let error = DownloadError.imageNotFound
                self.delegate?.downloadDidFinish(result: .failure(error))
                self.completionHandler?(.failure(error))
            }
        }
    }
}

// Creamos una instancia del descargador
let downloader = Downloader()

// Implementamos el delegado
class MyDelegate: DownloaderDelegate {
    func downloadDidFinish(result: Result<UIImage, Error>) {
           DispatchQueue.main.async {
               switch result {
               case .success(let image):
                   print("Delegado: La descarga ha finalizado con éxito.")
                   // Mostramos la imagen en el playground
                   let imageView = UIImageView(image: image)
                   imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                   PlaygroundPage.current.liveView = imageView
               case .failure(let error):
                   print("Delegado: Error en la descarga - \(error.localizedDescription)")
               }
           }
       }
   }


// Asignamos el delegado a la instancia del descargador
let myDelegate = MyDelegate()
downloader.delegate = myDelegate

// Ejemplo de uso del closure de completado

downloader.completionHandler = { result in
    DispatchQueue.main.async {
        switch result {
        case .success(let image):
            print("Closure de completado: La descarga ha finalizado con éxito.")
            // Mostramos la imagen en el playground
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            PlaygroundPage.current.liveView = imageView
        case .failure(let error):
            print("Closure de completado: Error en la descarga - \(error.localizedDescription)")
        }
    }
}

// Iniciamos la descarga
downloader.downloadFile()

// Necesario para mantener el playground en ejecución
PlaygroundPage.current.needsIndefiniteExecution = true
