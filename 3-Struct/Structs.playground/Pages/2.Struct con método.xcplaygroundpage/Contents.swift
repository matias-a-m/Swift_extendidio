
// Definir una estructura llamada Rectangle
struct Rectangle {
    var width: Double
    var height: Double
    
    // Propiedades no calculadas
    var area: Double {
        // Método getter que calcula el área multiplicando el ancho por la altura
        return width * height
    }
    
    var perimetro: Double {
        // Método getter que calcula el perímetro utilizando las propiedades de ancho y altura
        return 2 * (width + height)
    }
    
    // Propiedades calculadas
    var relacionAnchoAltura: Double {
        // Método getter que calcula la relación entre el ancho y la altura
        return width / height
    }
    
    var tieneAreaGrande: Bool {
        // Método getter que verifica si el área es mayor que 20.0 y devuelve un valor booleano
        return area > 20.0
    }
    
    // Propiedad no calculada
    var nombre: String = "Rectángulo"
}

// Crear una instancia de la estructura Rectangle
var rectangulo = Rectangle(width: 5.0, height: 3.0)

// Imprimir todas las propiedades con explicaciones
print("Ancho del \(rectangulo.nombre): \(rectangulo.width)")
print("Altura del \(rectangulo.nombre): \(rectangulo.height)")
print("Área del \(rectangulo.nombre): \(rectangulo.area)") // Accediendo a una propiedad no calculada
print("Perímetro del \(rectangulo.nombre): \(rectangulo.perimetro)") // Accediendo a otra propiedad no calculada
print("Relación Ancho/Altura del \(rectangulo.nombre): \(rectangulo.relacionAnchoAltura)") // Accediendo a una propiedad calculada
print("¿Tiene área grande el \(rectangulo.nombre)?: \(rectangulo.tieneAreaGrande)") // Accediendo a otra propiedad calculada
