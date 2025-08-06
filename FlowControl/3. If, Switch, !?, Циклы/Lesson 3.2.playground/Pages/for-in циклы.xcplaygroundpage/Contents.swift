//: [Previous](@previous)

import Foundation

/*: ## Циклы
> Операторы управления потоком. Используются для многократного выполнения задач. Делятся на For-in  и While циклы
 */

//: ## For-in циклы

/*:
 
    for counter in lower…upper {
        some code
    }
 
 */

for index in 1...5 {
    print(index)
}

for _ in 1...5 {
    print("Hello!")
}

var sum = 0

for index in 1...5 {
    sum += index
}

print(sum)

//: ### Итерация по массиву

let fruits = [
    "apple", "banana", "pineapple",
    "apple", "pear", "apple", "plum",
    "apricot", "apple"
]

var apple = 0

for fruit in fruits {
    if fruit == "apple" {
        apple += 1
    }
}


print("The number of apples is \(apple) pieces")

//: ### Итерация по словарю

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4] // [животное : лапки] ;)

for (animalName, legsCount) in numberOfLegs {
    print("\(animalName)s have \(legsCount) legs")
}

//: ### Итерация по тексту

let someText = "Hello!"

for char in someText {
    print(char)
}

//: [Next](@next)
