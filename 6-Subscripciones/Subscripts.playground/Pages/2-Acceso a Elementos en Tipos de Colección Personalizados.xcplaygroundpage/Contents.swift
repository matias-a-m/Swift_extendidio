class GameBoard {
    var cells: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)

    subscript(row: Int, column: Int) -> String {
        get {
            return cells[row][column]
        }
        set(newValue) {
            cells[row][column] = newValue
        }
    }

    // Función para imprimir el tablero actual
    func printBoard() {
        for row in 0..<3 {
            for column in 0..<3 {
                print(cells[row][column], terminator: " ")
            }
            print() // Nueva línea después de cada fila
        }
    }

    // Función para verificar si un jugador ha ganado
    func checkForWinner(player: String) -> Bool {
        // Verificar filas y columnas
        for i in 0..<3 {
            if cells[i][0] == player && cells[i][1] == player && cells[i][2] == player {
                return true // Fila completa
            }
            if cells[0][i] == player && cells[1][i] == player && cells[2][i] == player {
                return true // Columna completa
            }
        }

        // Verifica diagonales
        if cells[0][0] == player && cells[1][1] == player && cells[2][2] == player {
            return true // Diagonal principal completa
        }
        if cells[0][2] == player && cells[1][1] == player && cells[2][0] == player {
            return true // Diagonal secundaria completa
        }

        return false
    }
}

var ticTacToeBoard = GameBoard()

// Establece algunos valores en el tablero
ticTacToeBoard[0, 0] = "X"
ticTacToeBoard[0, 1] = "X"
ticTacToeBoard[0, 2] = "X"

ticTacToeBoard[1, 0] = "O"
//ticTacToeBoard[1, 1] = "O"
ticTacToeBoard[1, 2] = "O"

//ticTacToeBoard[2, 0] = "X"
ticTacToeBoard[2, 1] = "O"
//ticTacToeBoard[2, 2] = "X"


// Imprime el tablero actual
print("Tablero actual:")
ticTacToeBoard.printBoard()

// Verifica si "X" ha ganado
if ticTacToeBoard.checkForWinner(player: "X") {
    print("¡Jugador X ha ganado!")
} else {
    print("¡El juego continúa...")
}
