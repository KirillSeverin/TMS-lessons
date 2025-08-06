import UIKit

/*:
 ## Протоколы
 
Набор свойств и методов которые должны быть реализованы тем, кто подписан под данный протокол.
 
Методы объявленные в самом протоколе никак не реализованы (они лишь регламентируют входные параметры (с которыми нужно будет работать в этом методе) и возвращаемые значения).
 */
 
//: ## Рассмотрим стандартные swift протоколы

/*:
 ### CustomStringConvertable
 
 Типы, соответствующие протоколу CustomStringConvertible, могут предоставлять свое собственное представление для использования при преобразовании экземпляра в строку.
*/

let string = "Hello, World!"
print(string)

let number = 10
print(number)

let boolean = true
print(boolean)

// Информация о том что должно выводится на консоль, содержится в самом объекте

class Shoes {

    let color: String
    let size: Int
    let hasLaces: Bool
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces // шнурки
    }
}

extension Shoes: CustomStringConvertible {
    var description: String {
        return "Shoes(color: \(color), size: \(size), hasLaces: \(hasLaces))"
    }
}

let myShoes = Shoes(color: "Brown", size: 41, hasLaces: true)
print(myShoes)

/*:
 ### Equatable
 
Позволяет сравнивать данные.
 
Типы, соответствующие Equatable протоколу, можно сравнить на равенство с помощью оператора равенства (==) или неравенство с помощью оператора не равенства (!=).
*/
// Работник
struct Employee {
    
    let firstName: String
    let lastName: String
    let jobTitle: String
    let age: String
    let phoneNumber: String
    
}

let employees = [
    Employee(
        firstName: "firstName1",
        lastName: "lastName1",
        jobTitle: "Teacher",
        age: "30",
        phoneNumber: "3-75-25-123-12-12"
    ),
    Employee(
        firstName: "firstName2",
        lastName: "lastName2",
        jobTitle: "Header",
        age: "35",
        phoneNumber: "3-75-25-234-23-23"
    ),
    Employee(
        firstName: "firstName3",
        lastName: "lastName3",
        jobTitle: "Support",
        age: "25",
        phoneNumber: "3-75-25-345-34-34"
    )
]

let someEmployee = Employee(
    firstName: "firstName1",
    lastName: "lastName1",
    jobTitle: "Student",
    age: "30",
    phoneNumber: "3-75-25-123-12-12"
)

extension Employee: Equatable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName == rhs.firstName
            && lhs.lastName == rhs.lastName
    }
}

for employee in employees {
    if employee == someEmployee {
        print("The employee is registered in the company")
    }
}

/*:
 ### Comparable
 
Тип, который можно сравнить с помощью реляционных операторов<,<=, > = и >.
*/

extension Employee: Comparable {
    static public func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.age < rhs.age
    }
}

for employee in employees {
    if employee < someEmployee {
        print(employee)
    }
}

/*:
 ### Codable
 
Позволяет декодировать данные и раскладывать их по св-вам модели и соответственно кодировать.
 
Все базовые типы под этот протокол подписаны.
 
 */

extension Employee: Codable {}

// создадим кодировщик в jsonData
let jsonEncoder = JSONEncoder()

var data: Data!
if let jsonData = try? jsonEncoder.encode(someEmployee),
    let jsonString = String(data: jsonData, encoding: .utf8) {
    data = jsonData
    print(jsonString)
}

// создадим дешифровщик в нашу модель
let jsonDecoder = JSONDecoder()

if let someEmployee = try? jsonDecoder.decode(Employee.self, from: data) {
    print(someEmployee)
}

//: ### Создание собственного протокола



protocol FullyName {
    var fullName: String { get }
    func sayFullName()
}

extension FullyName {
    // опционально
    func doSomething() {}
}

struct PersonStruct: FullyName {

    let firstName: String
    let lastName: String

    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    func sayFullName() {
        print(fullName)
    }
}

class PersonClass: FullyName {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    let firstName: String
    let lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func sayFullName() {
        print(fullName)
    }
    
    func doSomething() {
        sayFullName()
    }
}

let personStruct = PersonStruct(firstName: "Evgeny", lastName: "Martinov")
personStruct.sayFullName()

let personClass = PersonClass(firstName: "Evgeny", lastName: "Martinov")
personClass.sayFullName()
personClass.doSomething()

//@objc protocol FullyName {
//    @objc optional var fullName: String { get }
//    @objc optional func sayFullName()
//}

//: ### Делегирование

protocol ButtonDelegate { // делегируем полномочия
    func userTappedButton(_ button: Button)
}

class Button {
    
    let title: String
    var delegate: ButtonDelegate?
    
    init(title: String) {
        self.title = title
    }
    
    func taped() {
        delegate?.userTappedButton(self) // передаем самого себя
    }
}

class GameController: ButtonDelegate {
    func userTappedButton(_ button: Button) {
        print("User pressed the button \(button.title)")
    }
}

let button = Button(title: "Start Game")
let gameController = GameController()

button.delegate = gameController
button.taped()

