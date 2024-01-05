
// El uso de desinicializadores (deinitializers) en Swift para cancelar tareas asíncronas puede ser un enfoque útil cuando se trabaja con objetos que manejan la ejecución de tareas. Aquí te dejo un ejemplo de cómo podrías estructurar un objeto con desinicializadores para manejar la cancelación de tareas:

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class AsyncTaskManager {
    private var task: Task<Void, Error>?

    init() {
        task = Task {
            do {
                try await asyncTask()
            } catch {
                print("Task failed with error: \(error)")
            }
        }
    }

    deinit {
        task?.cancel()
    }

    func asyncTask() async throws {
        for i in 1...10 {
            print("Task is running \(i)")
            await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        }
    }
}

// Crear una instancia de AsyncTaskManager
var taskManager: AsyncTaskManager? = AsyncTaskManager()

// Programar la cancelación después de 3 segundos
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    taskManager = nil // Esto desinicializará AsyncTaskManager y llamará al desinicializador
}

// La ejecución indefinida se mantiene para permitir la ejecución de la tarea
PlaygroundPage.current.needsIndefiniteExecution = true


//En este ejemplo:

//La clase AsyncTaskManager tiene un desinicializador que se encarga de cancelar la tarea cuando la instancia del objeto es desinicializada.
//La tarea se inicia en el inicializador de la clase (init).
//Se programa la cancelación de la tarea después de 3 segundos al establecer la variable taskManager en nil.
//Recuerda que los desinicializadores son llamados automáticamente cuando un objeto es desinicializado, por lo que son un buen lugar para realizar tareas de limpieza y, en este caso, para cancelar tareas asíncronas.

//: [Next](@next)
