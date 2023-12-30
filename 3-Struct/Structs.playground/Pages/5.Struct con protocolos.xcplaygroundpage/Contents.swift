# Patrones de Diseño en el Código

## 1. Modelo-View-ViewModel (MVVM):

- El código sigue el patrón MVVM, donde `LibraryItem` es el modelo, `LibraryItemViewModel` actúa como el ViewModel, y `LibraryItemView` y `LibraryViewController` forman la vista.
- Los ViewModel (`BookViewModel` y `MagazineViewModel`) encapsulan la lógica de presentación y formateo de los datos para su visualización en la interfaz de usuario.

## 2. Protocol-Oriented Programming (POP):

- Se utiliza el protocolo `LibraryItemViewModel` para definir una interfaz común para los diferentes tipos de ViewModel (`BookViewModel` y `MagazineViewModel`).
- La extensión del protocolo proporciona una implementación predeterminada para la propiedad `displayInfo`.

## 3. Inyección de Dependencias:

- La clase `LibraryViewController` toma un objeto conformante al protocolo `LibraryItemViewModel` como parámetro en su inicialización. Esto permite la inyección de dependencias, lo que facilita la prueba y la flexibilidad en el intercambio de implementaciones de ViewModel.

## 4. Separación de Responsabilidades:

- Cada tipo tiene una responsabilidad clara: `LibraryItem` es responsable de representar los datos del elemento de la biblioteca, `LibraryItemViewModel` se encarga de presentar esos datos de manera formateada, `LibraryItemView` actualiza la interfaz de usuario, y `LibraryViewController` coordina las interacciones entre el ViewModel y la Vista.

## 5. Single Responsibility Principle (SRP):

- Cada clase o estructura en el código tiene una responsabilidad única y bien definida.

## 6. Constructores de Diseño (Designated Initializers):

- Se utilizan inicializadores designados en los ViewModel (`BookViewModel` y `MagazineViewModel`) para garantizar que los objetos se creen con la información necesaria desde el principio.

## 7. Polimorfismo:

- La propiedad `displayInfo` en el protocolo `LibraryItemViewModel` es implementada de manera diferente en los ViewModel específicos (`BookViewModel` y `MagazineViewModel`), lo que demuestra el polimorfismo.


import Foundation

// Modelo para elementos de la biblioteca
struct LibraryItem {
    var title: String
    var year: Int
}

// ViewModel para elementos de la biblioteca
protocol LibraryItemViewModel {
    var displayInfo: String { get }
}

extension LibraryItemViewModel {
    var displayInfo: String {
        return ""
    }
}

// ViewModel para libros que cumple con LibraryItemViewModel
struct BookViewModel: LibraryItemViewModel {
    private let book: LibraryItem
    var author: String

    init(book: LibraryItem, author: String) {
        self.book = book
        self.author = author
    }

    var displayInfo: String {
        return "Libro: \(book.title) de \(author), publicado en \(book.year)"
    }
}

// ViewModel para revistas que cumple con LibraryItemViewModel
struct MagazineViewModel: LibraryItemViewModel {
    private let magazine: LibraryItem
    var issueNumber: Int

    init(magazine: LibraryItem, issueNumber: Int) {
        self.magazine = magazine
        self.issueNumber = issueNumber
    }

    var displayInfo: String {
        return "Revista: \(magazine.title), Número \(issueNumber), publicada en \(magazine.year)"
    }
}

// View que actualiza la interfaz de usuario
class LibraryItemView {
    func updateUI(withInfo info: String) {
        // Lógica para actualizar la interfaz de usuario con la información proporcionada
        print("UI actualizada con la siguiente información: \(info)")
    }
}

// Controlador de vista que actúa como coordinador
class LibraryViewController {
    private var itemViewModel: LibraryItemViewModel
    private let itemView = LibraryItemView()

    init(itemViewModel: LibraryItemViewModel) {
        self.itemViewModel = itemViewModel
    }

    func updateUI() {
        itemView.updateUI(withInfo: itemViewModel.displayInfo)
    }
}

// Uso de las estructuras con los ViewModel y la View
let book = LibraryItem(title: "Swift Programming", year: 2020)
let bookViewModel = BookViewModel(book: book, author: "John Doe")

let magazine = LibraryItem(title: "Tech Trends", year: 2023)
let magazineViewModel = MagazineViewModel(magazine: magazine, issueNumber: 42)

let bookViewController = LibraryViewController(itemViewModel: bookViewModel)
let magazineViewController = LibraryViewController(itemViewModel: magazineViewModel)

bookViewController.updateUI()     // Actualiza la UI con información del libro
magazineViewController.updateUI() // Actualiza la UI con información de la revista
