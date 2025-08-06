//: [Previous](@previous)

import UIKit

//: ## Структуры
// String, Int.. - это структуры

// Сделаем настольную игру в которой ходят по координатам
let playerOne = "Player One"
let playerOneXPosition = 10
let playerOneYPostion = 5

let playerTwo = "Player Two"
let playerTwoXPosition = 8
let playerTwoYPostion = 8
// Что то напоминает из прошлого урока?


func getPosition(for player: String, with x: Int, end y: Int) {
    print("The position of \(player): X\(x):Y\(y)")
}

getPosition(for: playerOne, with: playerOneXPosition, end: playerOneYPostion)
getPosition(for: playerTwo, with: playerTwoXPosition, end: playerTwoYPostion)

struct PositionOnMap {
    
    var player: String
    var x: Int
    var y: Int
    
    func getPosition() {
        print("The position of \(player): X\(x):Y\(y)")
    }
}

var playerOnePostion = PositionOnMap(player: "Player One", x: 10, y: 8)
var playerTwoPostion = PositionOnMap(player: "Player Two", x: 3, y: 7)
// Что тут с инициализатором? Почему он такой?

playerOnePostion.player
playerOnePostion.x = 7
playerOnePostion.y
// что будет если playerOnePostion будет константой?


playerOnePostion.getPosition()
playerTwoPostion.getPosition()

/*:
     struct StructureName {
        var nameOfVarioable: DataType
        func someFunction {
            some code
        }
     }
*/

//: ### Сравение классов и структур
// 1) Структуры не могут наследоваться от других структур. Каждая структура уникальна.
// 2) Структуры имеют встроенный инициализатор.
// 3) Структуры не являются ссылочным типом. При создании констант данные копируются в нее а не передаются по ссылке.
// 4) в классах всегда let, в структурах оба (var + let)
// 5) обычно структуры всегда используют для создания моделей данных

class MacBook {
    var name: String
    private var year: Int
    private var color: String
    
    init(name: String, year: Int, color: String) {
        self.name = name
        self.year = year
        self.color = color
    }
    
    func getSpecs() {
        print("\(name) \(year) \(color)")
    }
}

let macBookPro = MacBook(name: "Mac Book Pro", year: 2020, color: "Silver")

macBookPro.getSpecs()

let macBookAir = macBookPro
macBookAir.name = "MacBook Air"

macBookAir.getSpecs() // что тут будет?
macBookPro.getSpecs() // а тут что тут будет?

struct iPhone {
    var name: String
    var color: String
    var capacity: Int
    
    func getSpecs() {
        print("\(name) \(color) \(capacity)Gb")
    }
}

let iPoneXR = iPhone(name: "iPone XR", color: "Coral", capacity: 128)


var iPoneXS = iPoneXR
iPoneXS.name = "iPhone XS"

iPoneXR.getSpecs() // что тут будет?
iPoneXS.getSpecs() // а тут что тут будет?

//: ### Методы в структурах
// Прямоугольник
struct Rectangle {
    
    var width: Int
    var height: Int
    
    func calculateAria() -> Int {
        return width * height
    }
    
    // метод который увеличивает стороны на множитель
    mutating func scale(width: Int, height: Int) {
        self.width *= width
        self.height *= height
    }
    // mutating так как метод в struct хочет изменить св-ва
}

let rectangle = Rectangle(width: 10, height: 5)
rectangle.calculateAria()

//rectangle.scale(width: 2, height: 3)
//rectangle.calculateAria()

