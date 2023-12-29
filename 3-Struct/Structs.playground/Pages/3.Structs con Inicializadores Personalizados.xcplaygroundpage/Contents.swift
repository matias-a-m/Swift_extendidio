import Foundation

// Definición de la estructura Book
struct Book: Codable {
    var title: String
    var author: String
    var yearPublished: Int

    // Inicializador personalizado que toma el título y el autor, y establece el año de publicación en 0 por defecto
    init(title: String, author: String) {
        self.title = title
        self.author = author
        self.yearPublished = 0
    }

    // Método para convertir la instancia en datos JSON
    func encodeToJSON() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

// Uso de la estructura Book con el inicializador personalizado
let myBook = Book(title: "Swift Programming", author: "John Doe")

// Convertir la instancia en datos JSON
do {
    let jsonData = try myBook.encodeToJSON()
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("JSON representation:")
        print(jsonString)
    }
} catch {
    print("Error encoding to JSON: \(error)")
}
