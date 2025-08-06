
import Foundation
//: # Lesson 4

//: ## Функции

/*:
 
    func nameOfFunction() {
        some code
    }
 
 */
/*
addingTwoNumbers()

func addingTwoNumbers() {
    let a = 3
    let b = 2
    let c = a + b

    print(c)
}

addingTwoNumbers()
*/
//: ### Функции с возвращаемыми значениями

/*:
    func nameOfFunction() -> Data Type {
        some code
        return some value
    }
 
 */
/*
func addingTwoNumbers() -> Int {
    let a = 3
    let b = 2
    
    return a + b
 
    //print("Cool!!!")
}

var result = addingTwoNumbers()
print(result)
 
let funcAddingTwoNumbers = addingTwoNumbers

let result01 = funcAddingTwoNumbers()
print(result)
*/
//: ### Функции с параметрами

/*:
    func name(argumentOne parameterOne: Data Type, argumentTwo parameterTwo: Data Type) {
        some code
    }
 */
/*
func addingTwoNumbers(numberOne a: Int, numberTwo b: Int) -> Int {
    return a + b
}

let result2 = addingTwoNumbers(numberOne: 4, numberTwo: 6)

func addingTwoNumbers(parameterOne numberOne: Int, argumentTwo numberTwo: Int) -> Int {
    return numberOne + numberTwo
}

let result3 = addingTwoNumbers(parameterOne: 1, argumentTwo: 2)

func addingTwoNumbers(_ numberOne: Int, and numberTwo: Int) -> Int {
    return numberOne + numberTwo
}

let result4 = addingTwoNumbers(5, and: 8)
*/
//: > Параметров желательно писать неболее 5 на входе и 5 на выходе

//: [Next](@next)
