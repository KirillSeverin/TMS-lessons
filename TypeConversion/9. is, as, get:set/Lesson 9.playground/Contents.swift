import UIKit

/*: Контроль типов
 >Swift строго типизированный язык, но мы можем приводить типы (is - это, as - как)
 */

/*:
       Создадим систему регистрации домашних питомцев в поликлинике
 */

class Animal {
    var name = ""
//    var description = ""
    
    // что сделать override нужно свойство сделать вычисляемым
    var description: String {
        return "Animal"
    }
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal {
//    var description = "Dog"
    override var description: String {
        return "Dog"
    }
}

class Cat: Animal {
    override var description: String {
        return "Cat"
    }
}

class Bird: Animal {
    override var description: String {
        return "Bird"
    }
}

// создаем экземпляры класса
let dog = Dog()
let cat = Cat()
let bird = Bird()

// создаем универсальную ф-ю для Animals
func getClientPet(_ pet: Animal) -> Animal {
    return pet
}

let pet = getClientPet(dog)

if pet is Dog {
    print("The animal is a dog")
} else if pet is Cat {
    print("The animal is a cat")
} else if pet is Bird {
    print("The animal is a bird")
} else {
    print("It's an exotic animal")
}

let animal = Animal()

/*
// Что тут будет?
animal is Animal
animal is Dog
animal is Cat
 
dog is Dog
dog is Cat
dog is Animal
*/
 
// ф-я возвращает массив животных
func getPets() -> [Animal] {
    
    var pets: [Animal] = []
    
    let countOfDogs = Int.random(in: 1...5)
    let countOfCats = Int.random(in: 1...5)
    let countOfBirds = Int.random(in: 1...5)
    
    for n in 1...countOfDogs {
        let dog = Dog(name: "Dog\(n)")
        pets.append(dog)
    }
    
    for n in 1...countOfCats {
        let cat = Cat(name: "Cat\(n)")
        pets.append(cat)
    }
    
    for n in 1...countOfBirds {
        let bird = Bird(name: "Bird\(n)")
        pets.append(bird)
    }
    
    return pets
}

// вызываем
let pets = getPets()

// переменные для подсчета
var dogCount = 0
var catCount = 0
var birdCount = 0

// расчет животных
for pet in pets {
    if pet is Dog {
        dogCount += 1
    } else if pet is Cat {
        catCount += 1
    } else if pet is Bird {
        birdCount += 1
    }
}

print("There are \(dogCount) dogs, \(catCount) cats, \(birdCount) birds")

//: Приведение типов

/*:
      Создадим уникальные ф-ции для животных
 */

func walk(dog: Dog) {
    print("Walking \(dog.name)")
}

func cleanLitterBox(cat: Cat) {
    print("Cleaning the \(cat.name) litter box")
}

func cleanCage(bird: Bird) {
    print("Removing the \(bird.name) feathers at the bottom of the cage")
}

for pet in pets {
    if let dog = pet as? Dog { // приведение типов и извлечение
        walk(dog: dog)
    } else if let cat = pet as? Cat {
        cleanLitterBox(cat: cat)
    } else if let bird = pet as? Bird {
        cleanCage(bird: bird)
    }
}

//: Работа с типом Any (не определенный тип)

let items: [Any] = [1, "Tod", 7.6, dog]

var fistItem = items.first

if fistItem is Int {
    print("The \(fistItem!) is Integer")
} else if fistItem is String {
    print("The \(fistItem!) is String")
} else {
    print("The \(fistItem!) is another type")
}

// А как это сделать безопаснее?


// колода карт
var cards: [Any] = [2, 3, 5, "Queen", "King"]

func getSum(cards: [Any]) -> Int {
    
    var total = 0
    
    for card in cards {
        if let cardWithNumber = card as? Int {
            total += cardWithNumber
        }
    }
    
    return total
}

getSum(cards: cards)


//: Теперь посмотрим пример как приведение работает с UIViewController

class AnimalsViewController: UIViewController {
    
    let pets = getPets()
    var dogs: [Dog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDogs() // подсчет собак в животных
    }
    
    public func getDogs() {
        var count = 0
        
        for dog in pets {
            if dog is Dog {
                count += 1
                dog.name = "Dog \(count)"
                dogs.append(dog as! Dog)
            }
            // А как сделать лучше?
        }
    }
    
    // метод передачи значений при переходе на следующий контроллер
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dogsVC = segue.destination as! DogsViewController
        dogsVC.dogs = dogs
    }
}

class DogsViewController: UIViewController {
    var dogs: [Dog]!
}

/*
let animalsViewController = AnimalsViewController()
animalsViewController.getDogs()

print(animalsViewController.pets)
print(animalsViewController.dogs)
*/

/*
 Пример с get и set у properties
 struct Square {
   var edge: Double = 0
   var area: Double {
     get {
       return edge * edge
     }
     set (newArea){
       edge = sqrt(newArea)
     }
   }
  }
 */
