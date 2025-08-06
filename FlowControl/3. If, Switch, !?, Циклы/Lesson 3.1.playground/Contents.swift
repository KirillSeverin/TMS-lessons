//Урок № 3.1

import UIKit

/*: ## Конструкция if
 >  Оператор ветвления - позволяет разделить код на разные потоки
 */
/*:
    if condition (состояние) {
        some code (зона видимости или тело оператора (обьявленные тут св-ва доступны только тут и удаляются за пределами))
    }
 
*/

print("====КОНСТРУКЦИЯ if====")

var someNumber = 10

if someNumber < 4 { // False
    print("The condtion is true")
}

someNumber = 1

if someNumber < 4 { // True
    print("The condtion is true")
}

/*:
    if conditionOne {
        some code
    } else if conditionTwo {
        some code
    }
*/

print("\n====КОНСТРУКЦИЯ else if====")

someNumber = 10

if someNumber < 4 { // False
    print("The first condtion is true")
} else if someNumber < 8 { // False
    print("The second condtion is true")
}

someNumber = 7

if someNumber < 4 { // False
    print("The first condtion is true")
} else if someNumber < 8 { // True
    print("The second condtion is true")
}

someNumber = 1

if someNumber < 4 { // True
    print("The first condtion is true")
} else if someNumber < 8 { // True
    print("The second condtion is true")
}

/*:
    if conditionOne {
        some code
    } else if conditionTwo {
        some code
    } else {
        some code
    }
 */

print("\n====КОНСТРУКЦИЯ if-else====")

someNumber = 10

if someNumber < 4 { // False
    print("The first condtion is true")
} else if someNumber < 8 { // False
    print("The second condtion is true")
} else if someNumber < 10 { // False
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

if someNumber < 4 { // False
    print("The first condtion is true")
} else if someNumber < 8 { // False
    print("The second condtion is true")
} else if someNumber <= 10 { // True
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

if someNumber < 4 { // False
    print("The first condtion is true")
} else if someNumber < 8 { // False
    print("The second condtion is true")
} else if someNumber >= 10 { // True
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

if someNumber < 4 { // False
    print("The first condtion is true")
} else if someNumber < 8 { // False
    print("The second condtion is true")
} else if someNumber == 10 { // True
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

//: ### Использование логических операторов
//: ### Оператор логического И

print("\n====ОПЕРАТОР ЛОГИЧЕСКОГО И====")

var a = 1
var b = 1

if a < 4 && b < 4 { // True
    print("The first condtion is true")
} else if a < 8 { // True, but not run
    print("The second condtion is true")
} else if a == 10 { // False
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

b = 10

if a < 4 && b < 4 { // False
    print("The first condtion is true")
} else if a < 8 { // True
    print("The second condtion is true")
} else if a == 10 { // False
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

//: ### Оператор логического ИЛИ

print("\n====ОПЕРАТОР ЛОГИЧЕСКОГО ИЛИ====")

if a < 4 || b < 4 { // True
    print("The first condtion is true")
} else if a < 8 { // True, but not run
    print("The second condtion is true")
} else if a == 10 { // False
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

var c = a + b

if (a < 4 || b < 4) && c == 3 { // False
    print("The first condtion is true")
} else if a < 8 { // True
    print("The second condtion is true")
} else if a == 10 { // False
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

//: ### Оператор логического НЕ

print("\n====ОПЕРАТОР ЛОГИЧЕСКОГО НЕ====")

a = 10
b = 1
c

if (a < 4 || b < 4) && c != 3 { // True
    print("The first condtion is true")
} else if a < 8 { // False
    print("The second condtion is true")
} else if a == 10 { // true, but not run
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

if (a < 4 || b < 4) && c != 11 { // False
    print("The first condtion is true")
} else if a < 8 { // False
    print("The second condtion is true")
} else if a == 10 && b == 1 { // True
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

if (a < 4 || b < 4) && c != 11 { // False
    print("The first condtion is true")
} else if a < 8 { // False
    print("The second condtion is true")
} else if !(a == 10 && b == 10) { // True
    print("The third condtion is true")
} else {
    print("Nothing was true")
}

/*:### Тернарный оператор
 > condition ? some code : some code
 */

print("\n====ТЕРНАРНЫЙ ОПЕРАТОР====")

if a < 10 {
    print("The condition is true")
} else {
    print("The condition is false")
}

a < 10 ? print("The condition is true") : print("The condition is false")

if a < 10 {
    c = a - b
} else {
    c = a + b
}

c = a < 10 ? a - b : a + b

//: ## Switch statement
/*:
    switch значение для сопоставления {
    case значение 1:
        инструкция для первого значения
    case значение 2, значение 3:
        инструкция для второго и третьего значения
    default:
        инструкция, если совпадений с шаблонами не найдено
    }
*/

print("====SWITCH STATEMENT====")

var someCharacter: Character = "a"

if someCharacter == "a" {
    print("Is an A")
} else if someCharacter == "b" {
    print("Is an B")
} else if someCharacter == "c" {
    print("Is an C")
} else {
    print("Don't know what is it")
}

someCharacter = "B"

if someCharacter == "a" || someCharacter == "A" {
    print("Is an A")
} else if someCharacter == "b" || someCharacter == "B" {
    print("Is an B")
} else if someCharacter == "c" || someCharacter == "C" {
    print("Is an C")
} else {
    print("Don't know what is it")
}

switch someCharacter {
case "a", "A":
    print("Is an A")
case "b", "B":
    print("Is an B")
case "c", "C":
    print("Is an C")
default:
    print("Don't know what is it")
}

//: ### Соответствие диапазону

print("====СООТВЕТСТВИЕ ДИАПАЗОНУ====")

let approximateCount = 62                     // точный подсчет
let countedThings = "moons orbiting Saturn"
var naturalCount = ""                         // естественный счет

switch approximateCount {
case 0:
    naturalCount = "no"         // нет
case 1:
    naturalCount = "one"        // один
case 1...4:
    naturalCount = "a few"      // немного
case 5...11:
    naturalCount = "several"    // несколько
case 12...99:
    naturalCount = "dozens of"  // десятки
default:
    naturalCount = "many"       // много
}

print("There are \(naturalCount) \(countedThings)")

//: ## Опциональные типы

var someString = ""            // обьявленна переменная и инициализарована пустой строкой
var anotherString: String      // обьявленна, но не инициализарована
var optionalString: String?    // обьявленна переменная и инициализарована как nil (может принимать nil и String)

var possibleNumber = "1234"
var convertedNumber = Int(possibleNumber)

possibleNumber = "123t"
convertedNumber = Int(possibleNumber)

convertedNumber = 16
convertedNumber = nil

//: ### Извлечение опционалов

if convertedNumber == nil {
    print("convertedNumber does not contains some integer value")
}

//: ### Принудительное извлечение опционалов

convertedNumber = 16

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

possibleNumber = "23!"
//someNumber = Int(possibleNumber)! // Fatal error

//: ### Привязка опционалов

possibleNumber = "123"

if let actualNumber = Int(possibleNumber) {
    print("String '\(possibleNumber)' has an integer value of \(actualNumber)")
} else {
    print("String '\(possibleNumber)' could't be converted to an integer")
}

/*: ### Неявно извлеченные опционалы
>  На этапе обьявления свойств уже извекаем опционал, это тот же опционал, но с этим свойством можно работать не извлекая его
 */

var assumedString: String! = "An implicity unwrapped optional value" // Неявно развернутое необязательное значение

someString = assumedString

assumedString = nil
//someString = assumedString // Fatal error

