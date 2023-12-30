# Ejemplo práctico de Structs con Protocolos
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

## 6.Constructorese Diseño (Designated Initializers):

- Se utilizan inicializadores designados en los ViewModel (`BookViewModel` y `MagazineViewModel`) para garantizar que los objetos se creen con la información necesaria desde el principio.

## 7. Polimorfismo:

- La propiedad `displayInfo` en el protocolo `LibraryItemViewModel` es implementada de manera diferente en los ViewModel específicos (`BookViewModel` y `MagazineViewModel`), lo que demuestra el polimorfismo.


