//: [Previous](@previous)

import Foundation

//: ### Функции как замыкания

//: Отбираем числа меньше заданного значения
// Создать массив значений, которые < someValue из arrayOfNumbers

func filterLesThanValue(value: Int, numbers: [Int]) -> [Int] {
    
    var filteredSetOfNumbers: [Int] = []
    
    for number in numbers {
        if number < value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

let someValue = 5
let arrayOfNumbers = [5, 8, 20, 13, 1, 4, 3, 6]

filterLesThanValue(value: someValue, numbers: arrayOfNumbers)

//: Отбираем числа больше заданного значения

// Создать массив значений, которые > someValue из arrayOfNumbers

func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int] {
    
    var filteredSetOfNumbers = [Int]()
    
    for number in numbers {
        if number > value {
            filteredSetOfNumbers.append(number)
        }
    }
    return filteredSetOfNumbers
}

filterGreaterThanValue(value: someValue, numbers: arrayOfNumbers)

//: Функция для отбора чисел, относительно заданного значения

// добавим в ф-ю замыкание closure: (Int, Int) -> Bool

func filterWithPredicateClosure(value: Int, numbers: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    
    var filterNumbers = [Int]()
    
    for number in numbers {
        if closure(number, value) { // closure принимает 2-а Int значения и сравнивает их
            filterNumbers.append(number)
        }
    }
    return filterNumbers
}

//: Функция для отбора числе меньше указанного значения

func lesThanValue(number: Int, value: Int) -> Bool {
    return number < value
}

//: Функция для отбора числе больше указанного значения

func greaterThanValue(number: Int, value: Int) -> Bool {
    return number > value
}

//: Отбор чисел меньше указанного значения

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : lesThanValue)

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : greaterThanValue)

//: ### Замыкающие выражения

/*:
 
 Замыкания бывают трех видов:
 
 - Глобальные функции — это замыканиями, у которых есть имя и которые не захватывают никакие значения.
 
 - Вложенные функции — это замыканиями, у которых тоже есть имя, но при этом они могут использовать или захватывать значения из родительской функции.
 
 - Замыкающие выражения - это безымянные функции, которые написаны в облегченном синтаксисе, которые могут захватывать значения из окружающего контекста
 
 Под замыканиями понимают ф-ции которые не имеют имени, те это сгруппированный в контейнер код, который может быть передан в виде аргумента и многократно использован
 
 */

/*:
 { (параметры) -> тип результата in
 тело замыкающего выражения
 }
 */



//: Изпользование замыкания в качестве аргумента

//: Отбор чисел меньше указанного значения

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { (number: Int, value: Int) -> Bool in
                            return number < value
                           }) // создаем и передаем замыкание

//: Отбор чисел больше указанного значения

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { (number: Int, value: Int) -> Bool in
                            return number > value
                           }) // создаем и передаем замыкание

//: Вывод типа из контекста

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { (number, value) in
                            return number < value
                           }) // можем не указывать типы тк компилятор их ожидает

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { (number, value) in
                            return number > value
                           }) // можем не указывать типы тк компилятор их ожидает

//: Неявные возвращаемые значения из замыканий с одним выражением

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { (number, value) in number < value
                           }) // return тоже можно не писать так как это единственное действие)

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { (number, value) in number > value
                           }) // return тоже можно не писать так как это единственное действие)

//: Сокращенные имена параметров

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { $0 < $1 })

filterWithPredicateClosure(value   : someValue,
                           numbers : arrayOfNumbers,
                           closure : { $0 > $1 })

//: Последующее замыкание
// тк последний параметр - замыкание - можно вынести за скобки)
// замыкания всегда ставим в конец

filterWithPredicateClosure(value: someValue, numbers: arrayOfNumbers) { $0 < $1 }
filterWithPredicateClosure(value: someValue, numbers: arrayOfNumbers) { $0 > $1 }

var array = filterWithPredicateClosure(value: someValue, numbers: arrayOfNumbers) { $0 < $1 }
array
array = filterWithPredicateClosure(value: someValue, numbers: arrayOfNumbers) { $0 > $1 }
array
//: Операторные функции

filterWithPredicateClosure(value: someValue, numbers: arrayOfNumbers, closure: <)
filterWithPredicateClosure(value: someValue, numbers: arrayOfNumbers, closure: >)

//: Переменные-замыкания

var someVariable: (_ numberOne: Int, _ numberTwo: Int) -> Int = {
    return $0 + $1
}

someVariable(7, 9)

//: Захват переменных
// захват переменных из вне ( те замыкания могут захватывать значения констант и переменных из окружающего контекста (в котором оно объявлено) )
// после захвата замыкание может ссылаться на эти значения или модифицировать их внутри своего тела,
// даже если область в которой были объявлены эти переменные уже более не существует

var a = 3
var b = 5

let c: () -> Int = { // не принимает параметры но возвращает
    [a, b] in        // [..,..] - значения которые хотим захватить
    a + b
}

c()

a = 8
b = 13

c()

//: [Next](@next)
