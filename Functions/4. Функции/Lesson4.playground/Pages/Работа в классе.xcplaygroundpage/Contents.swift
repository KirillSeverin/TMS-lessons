//: [Previous](@previous)

import Foundation

/*:
 # Сделать следующие задания:
 */



/*:
 1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций)
 */
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
     return a - b
}

func multiply(_ a: Int, _ b : Int) -> Int {
     return a * b
}

func split(_ a: Int, _ b: Int) -> Double {
     let result = a / b
     return Double(result)
}

func add(_ a: String, _ b: String) -> String {
    let result = a + b
    return String(result)
}
add("454", "454")

enum math {
    case adding
    case subtraction
    case rise
    case noun
}

var global = math.adding
func calculate(a: Int, b: Int, global: math) -> Double {
    switch global {
    case .adding: return Double(a + b)
    case .subtraction: return Double(a - b)
    case .rise: return Double(a * b)
    case .noun: return Double(a / b)
    }
    
}
calculate(a: 54, b: 67, global: global)
//generics
/*:
 2. Вычислить сумму цифр четырехзначного числа
 */
func fourDigitsSum(_ integer: Int) -> Int {
    let firstDigit = integer / 1000
    let secondDigit = integer / 100 % 10
    let thirdDigit = integer / 10 % 10
    let fourthDigit = integer % 10
    return firstDigit + secondDigit + thirdDigit + fourthDigit
}

fourDigitsSum(5368)
/*:
 3. Функция сравнения строк - "авб" больше "ввш"
 */
func comparison(One: String, Two: String) -> Bool {
    return One > Two
}
// comparison(One: "af", Two: "bg")

/*:
 4. Циклический вызов функций - поломать приложение
 */
var application = 4
while application > 0 {
    
}


/*:
 5. Функция возведения в степень с дефолтным параметром
 */
//(1, 3) -> result


/*:
 6. Функция вычисления факториала числа
 */



//: [Next](@next)
