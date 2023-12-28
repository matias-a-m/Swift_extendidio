import Foundation

// Data model
struct DataModel {
    var name: String
    var age: Int
}

// Definition of the ViewState enumeration
enum ViewState {
    case loading
    case displayingData(DataModel)
    case error(message: String)
}

// Definition of the ViewController class
class ViewController {
    var currentViewState: ViewState = .loading

    // Function to simulate data loading from an external source
    func loadData(completion: @escaping (LoadResult) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Simulating successful data loading in this example
            let loadedData = DataModel(name: "John Doe", age: 30)
            completion(.success(data: loadedData))
            
            // We could also simulate an error by uncommenting the following line:
            // let errorMessage = "Error loading data"
            // completion(.failure(message: errorMessage))
        }
    }

    // Function to handle the view state
    func handleViewState(_ newState: ViewState) {
        print("State transition:")
        print("From \(currentViewState) to \(newState)")
        currentViewState = newState
        animateStateChange()
    }

    // Function to animate changes in the view state (simulated)
    func animateStateChange() {
        print("Animation: Animated state change")
    }
}

// Definition of a load result (success or failure)
enum LoadResult {
    case success(data: DataModel)
    case failure(message: String)
}

// Using the ViewController class in a Playground
let viewController = ViewController()

// Simulating data loading after 3 seconds
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    viewController.loadData { result in
        switch result {
        case .success(let data):
            viewController.handleViewState(.displayingData(data))
        case .failure(let message):
            viewController.handleViewState(.error(message: message))
        }
    }
}
