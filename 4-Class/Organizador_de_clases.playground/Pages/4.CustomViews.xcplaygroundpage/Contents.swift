// Definición de la clase PuntuacionView, que hereda de UIView
class PuntuacionView: UIView {
    // Propiedad para almacenar la puntuación, con un valor inicial de 0
    var puntuacion: Int = 0 {
        // didSet se llama automáticamente cuando el valor de puntuacion cambia
        didSet {
            // Actualizar la presentación cuando cambia la puntuación
            // (Aquí se podría implementar la lógica para actualizar la vista de acuerdo con la nueva puntuación)
        }
    }
    
    // Lógica para dibujar la vista de puntuación personalizada
    // (Esta parte puede contener métodos y propiedades adicionales para personalizar la apariencia de la vista)
}

// Crear una instancia de PuntuacionView
let puntuacionView = PuntuacionView()

// Establecer la puntuación de la vista en 85
puntuacionView.puntuacion = 85
