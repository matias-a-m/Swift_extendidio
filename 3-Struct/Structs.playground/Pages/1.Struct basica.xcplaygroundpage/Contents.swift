
// Definición de una estructura llamada 'Point'
struct Point {
    // Propiedades de la estructura
    var x: Double
    var y: Double
}

// Creación de una instancia de la estructura 'Point'
var myPoint = Point(x: 3.0, y: 4.0)

// Acceso a las propiedades de la estructura
print("Coordenada x: \(myPoint.x)")
print("Coordenada y: \(myPoint.y)")

// Modificación de las propiedades
myPoint.x = 7.0
myPoint.y = 8.0

// Acceso nuevamente a las propiedades después de la modificación
print("Nueva coordenada x: \(myPoint.x)")
print("Nueva coordenada y: \(myPoint.y)")
