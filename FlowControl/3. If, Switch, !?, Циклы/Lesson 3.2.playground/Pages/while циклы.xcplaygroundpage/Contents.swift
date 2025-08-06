//: [Previous](@previous)

import Foundation

/*: ## While циклы
>  Цикл выполняется до тех пор, пока условие не станет false
 */

/*:
 
    while condition {
        some code
    }
 
 */

var counter = 10

while counter > 0 {
    print(counter)
    counter -= 1
}

counter = 5

while counter > 0 {
    print(counter)
    counter -= 1
}


/*:
 
    repeat {
        some code
    } while condition
 
    цикл выполнится 1 раз в любом случае
 
 */

counter = 0

repeat {
    print("repeat: ", counter)
    counter -= 1
} while counter > 0

counter

//: [Next](@next)
