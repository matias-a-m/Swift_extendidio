// Clase que representa un producto en la tienda
class Product {
    var name: String
    var price: Double

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

// Clase que gestiona el carrito de compras
class ShoppingCart {
    // Variable privada que almacena los productos en el carrito
    private var items: [Product] = []

    // Método para agregar un producto al carrito
    func addItem(product: Product) {
        // Lógica para agregar un producto al carrito
        items.append(product)
        print("\(product.name) ha sido añadido al carrito.")
    }

    // Método para mostrar el contenido del carrito
    func displayCart() {
        // Mostrar los productos en el carrito
        if items.isEmpty {
            print("El carrito está vacío.")
        } else {
            print("Productos en el carrito:")
            for product in items {
                print("\(product.name) - $\(product.price)")
            }
            print("Total: $\(calculateTotal())")
        }
    }

    // Método privado para calcular el total de la compra
    // La palabra clave 'private' indica que este método solo es accesible dentro de la clase ShoppingCart.
    private func calculateTotal() -> Double {
        // Calcular el total de la compra sumando los precios de todos los productos en el carrito
        var total = 0.0
        for product in items {
            total += product.price
        }
        return total
    }
}

// Ejemplo de uso
// Crear algunos productos
let laptop = Product(name: "Laptop", price: 1200.0)
let phone = Product(name: "Smartphone", price: 800.0)
let headphones = Product(name: "Headphones", price: 100.0)

// Crear un carrito de compras
let shoppingCart = ShoppingCart()

// Agregar productos al carrito
shoppingCart.addItem(product: laptop)
shoppingCart.addItem(product: phone)
shoppingCart.addItem(product: headphones)

// Mostrar el contenido del carrito
shoppingCart.displayCart()
