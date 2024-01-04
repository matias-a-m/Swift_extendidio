// Definir el protocolo Vehicle
protocol Vehicle {
    var brand: String { get }
    var model: String { get }
    var year: Int { get }
    
    func start()
    func stop()
}

// Definir la enumeración VehicleType
enum VehicleType: String {
    case car
    case motorcycle
    case bicycle
}

// Crear estructuras que representan vehículos y conforman al protocolo Vehicle
struct Car: Vehicle {
    var brand: String
    var model: String
    var year: Int
    
    func start() {
        print("Encendiendo el motor del \(brand) \(model)...")
    }
    
    func stop() {
        print("Apagando el motor del \(brand) \(model)...")
    }
}

struct Motorcycle: Vehicle {
    var brand: String
    var model: String
    var year: Int
    
    func start() {
        print("Encendiendo el motor de la \(brand) \(model)...")
    }
    
    func stop() {
        print("Apagando el motor de la \(brand) \(model)...")
    }
}

struct Bicycle: Vehicle {
    var brand: String
    var model: String
    var year: Int
    
    func start() {
        print("¡Comienza a pedalear en la \(brand) \(model)!")
    }
    
    func stop() {
        print("Deteniéndote en la \(brand) \(model)...")
    }
}

// Función para crear un vehículo según el tipo
func createVehicle(type: VehicleType, brand: String, model: String, year: Int) -> Vehicle {
    switch type {
    case .car:
        return Car(brand: brand, model: model, year: year)
    case .motorcycle:
        return Motorcycle(brand: brand, model: model, year: year)
    case .bicycle:
        return Bicycle(brand: brand, model: model, year: year)
    }
}

// Ejemplo de uso
let car = createVehicle(type: .car, brand: "Toyota", model: "Camry", year: 2022)
let motorcycle = createVehicle(type: .motorcycle, brand: "Honda", model: "CBR", year: 2021)
let bicycle = createVehicle(type: .bicycle, brand: "Giant", model: "Defy", year: 2020)

car.start()
car.stop()

motorcycle.start()
motorcycle.stop()

bicycle.start()
bicycle.stop()
