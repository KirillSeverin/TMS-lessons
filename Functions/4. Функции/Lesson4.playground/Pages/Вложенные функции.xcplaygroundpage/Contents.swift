//: [Previous](@previous)

import Foundation

//: ### Вложенные функции

// такие ф-ции доступны внутри родительской ф-ции

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward : stepForward
}

var currentValue = 5

var moveNearerToZero = chooseStepFunction(backward: currentValue > 0) // moveNearerToZero является функцией stepForward

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!")

//: [Next](@next)
