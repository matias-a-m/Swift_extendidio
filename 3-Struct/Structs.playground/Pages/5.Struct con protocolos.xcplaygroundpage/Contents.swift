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
