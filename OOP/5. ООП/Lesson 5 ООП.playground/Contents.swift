import UIKit

//: # Lesson 5. ООП.
//: ## Классы

// БЛОГ
// Создаем пост


let postTitle = "Classes"
let postBody = "Text of the article"
let postAuthor = "Evgeny"

let postTitle2 = "Properties of classes"
let postBody2 = "Text of the article"
let postAuthor2 = postAuthor

// Явное дублирование кода !!!
// Объеним все эти свойства в Класс

class PostSimple {
    var title = ""
    var body = ""
    var author = ""
}

let firstPostSimple = PostSimple() // инициализация объекта с типом PostSimple // ссылка на ячейку в памяти
// ссылка - константа

firstPostSimple.title = "This is my first post"
firstPostSimple.body = "A lot of text"
firstPostSimple.author = "Evgeny"
// св-ва - переменные

let secondPostSimple = firstPostSimple
//let secondPostSimple = PostSimple()

secondPostSimple.title = "Second post"
secondPostSimple.body = "Hello"
secondPostSimple.author

print("Author \(firstPostSimple.author) has published new post '\(firstPostSimple.title)' with text '\(firstPostSimple.body)'")

print("Author \(secondPostSimple.author) has published new post '\(secondPostSimple.title)' with text '\(secondPostSimple.body)'")

firstPostSimple === secondPostSimple // ссылаются ли указатели на 1 объект в памяти?

/*: ### Методы классов
 > Могут быть методы экземпляра и статические методы (методы класса)
 */

class Post {
    
    var title = ""
    var body = ""
    var author = ""
    
    // количество комментариев к постам
    private var numberOfComments = 0 // инкапсулировали св-во
    // везде ставим private (компилятор поможет)
    
    func addComment() {
        numberOfComments += 1
    }
    
    // ф-я для возврата инкапсулированной переменной
    func description() -> Int {
        return numberOfComments
    }
    
    // static func используются редко в основном в отдельном классе (менеджеры, сервисные классы и т.д.)
    static func printHello() {
        print("Hello static func!!!")
    }
}

let firstPost = Post()

firstPost.title = "This is my first post"
firstPost.body = "A lot of text"
firstPost.author = "Evgeny"

firstPost.addComment()
firstPost.addComment()

// Пример инкапсуляции
// firstPost.numberOfComments = 60
// firstPost.addComment()
// firstPost.addComment()

let secondPost = Post()

secondPost.title = "Second post"
secondPost.body = "Hello"
secondPost.author

print("The number of comments for the post \(firstPost.title) is \(firstPost.description())")

print("The number of comments for the post \(secondPost.title) is \(secondPost.description())")

Post.printHello()

//: ### Инициализация

class HumanSimple {
    
    var name = ""
    var age = 0
    
    // первый инициализатор
    init() {}
    
    // второй инициализатор со св-ми
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let humanSimple = HumanSimple()

humanSimple.name
humanSimple.age

let personSimple = HumanSimple(name: "Ron", age: 23)

personSimple.name
personSimple.age

//: ### Наследовение

class Human {
    
    var name = ""
    var age = 0
    
    init() {}
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func walk() {
        print("I can walk")
    }
    
    func sleep() {
        print("I need sleep")
    }
    
    func eat() {
        print("I need food")
    }
}

let person = Human(name: "Ron", age: 23)

person.name
person.age
person.walk()

class Child: Human {
    
    func nursing() {  // уход
        if age <= 5 {
            print("I need care") // Мне нужен уход
        } else {
            print("I can eat independently") // Я могу есть самостоятельно
        }
    }
    
    func parenting() { // воспитание
        if age >= 5 && age <= 13 {
            print("I need an education") // Мне нужно образование
        } else if age < 5 {
            print("Me too early to educate") // Меня слишком рано воспитывать
        } else {
            print("Me too late to educate") // Меня слишком поздно воспитывать
        }
    }
}

let littleBoy = Child(name: "Tom", age: 4)

littleBoy.name
littleBoy.sleep()
littleBoy.nursing()
littleBoy.parenting()

class SchoolChild: Child {
    
    func schooling() { // школьничать
        if age >= 6 && age <= 17 {
            print("I have to go to school") // Мне нужно идти в школу
        } else {
            print("I'm still too early in school") // Еще рано
        }
    }
}

let schoolHild = SchoolChild(name: "Sara", age: 5)

schoolHild.schooling()

/*:
 > Human для Child это super class (родительский класс). Child - это наследник (можно обращаться только к public унаследованным св-м и методам, private - инкапсулированы)
 */

//: ### Полиморфизм

// Фигура
class Figure {
    func draw() {} // рисовать (в данном случае draw - это интерфейс)
}
// Круг
class Circle: Figure {
    override func draw() { // переопределяем draw
        print("Draw circle")
    }
}
// Прямоугольник
class Rectangle: Figure {
    override func draw() {
        print("Draw rectangle")
    }
}
// Треугольник
class Triangle: Figure {
    override func draw() {
        print("Draw triangle")
    }
}

let circle = Circle()
let rectangle = Rectangle()
let triangle = Triangle()

func drawFigure(_ figure: Figure) {
    figure.draw()
}



drawFigure(circle)
drawFigure(triangle)
drawFigure(rectangle)

//: ### Singleton Class - один из паттернов проектирования
/*
class LocationManager: NSObject {
    
    static let shared = LocationManager()
    
    private override init() {}
    
    var locationGranted: Bool?    // местоположение предоставлено?
    
    //MARK: - Location Permission
    func requestForLocation(){    // запрос на местоположение
        //Code Process
        locationGranted = true
        print("Location granted") // местоположение предоставлено
    }
}

//Access the class
let location = LocationManager.shared //initialization class
location.requestForLocation()         //Call function here

//In a single line you can access easily
LocationManager.shared.requestForLocation() // "Location granted"

//Access variable value
print(LocationManager.shared.locationGranted ?? false) // true
*/
