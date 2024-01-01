import Foundation

// Protocolo para las tareas
protocol Task {
    var title: String { get }
    var isCompleted: Bool { get set }
    
    func markAsCompleted()
}

// Implementación de una clase de tarea
class SimpleTask: Task {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
    func markAsCompleted() {
        isCompleted = true
        print("La tarea '\(title)' ha sido marcada como completada.")
    }
}

// Protocolo para la gestión de tareas
protocol TaskManager {
    var tasks: [Task] { get }
    
    func addTask(_ task: Task)
    func completeTaskAtIndex(_ index: Int)
}

// Implementación de una clase para la gestión de tareas
class TaskListManager: TaskManager {
    var tasks: [Task] = []
    
    func addTask(_ task: Task) {
        tasks.append(task)
        print("Se ha añadido la tarea '\(task.title)'.")
    }
    
    func completeTaskAtIndex(_ index: Int) {
        guard index >= 0, index < tasks.count else {
            print("Índice de tarea no válido.")
            return
        }
        
        let task = tasks[index]
        task.markAsCompleted()
    }
}

// Crear instancias de tareas
let task1 = SimpleTask(title: "Hacer la compra")
let task2 = SimpleTask(title: "Preparar presentación")

// Crear instancia del gestor de tareas
let taskManager = TaskListManager()

// Añadir tareas al gestor
taskManager.addTask(task1)
taskManager.addTask(task2)

// Imprimir lista de tareas antes de completarlas
print("Lista de tareas:")
for (index, task) in taskManager.tasks.enumerated() {
    print("\(index + 1). \(task.title) - \(task.isCompleted ? "Completada" : "Pendiente")")
}

// Completar una tarea
taskManager.completeTaskAtIndex(0)

// Imprimir lista de tareas después de completarlas
print("\nLista de tareas después de completar una tarea:")
for (index, task) in taskManager.tasks.enumerated() {
    print("\(index + 1). \(task.title) - \(task.isCompleted ? "Completada" : "Pendiente")")
}
