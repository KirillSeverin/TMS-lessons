import UIKit

//: # Урок 4. Типы коллекций
//: ## Массивы
//: > Хранят в себе упорядоченные, но при этом не уникальные значения одного типа

let arrayOfStrings = ["a", "b", "c", "a", "a"] // Неизменяемый массив с типом данных String
// индекс всегда начинается с 0

let arrayOfCharacters: [Character] = ["a", "b", "a"] // Неизменяемый массив с типом данных Character

var arrayOfIntegers = [Int]() // Пустой массив с типом Int

var anotherArrayOfIntegers: [Int] = [] // Пусто массив

arrayOfIntegers = [1, 2, 3] // Присвоение данных массиву

arrayOfIntegers = [4, 5, 6] // Теперь наш массив имеет другие данные

arrayOfIntegers += [7, 8] // Добавление новых значений к уже существующим

arrayOfIntegers.append(9) // Добавление новго значения при помощи метода append

arrayOfIntegers.insert(1, at: 0) // Добавление нового элемента по индексу

let someArrayOfIntegers = [12, 17]

anotherArrayOfIntegers = arrayOfIntegers + someArrayOfIntegers // Создание нового массива, путём объеденения двух других массивов

anotherArrayOfIntegers.removeLast() //Удаление последнего элемента из массива

let lastValueFromArray = anotherArrayOfIntegers.removeLast() //Удаление последнего элемента из массива и сохранение его в константе

anotherArrayOfIntegers //Результат после удаления последнего элемента

let firstValueFromArray = anotherArrayOfIntegers.removeFirst() //Удаление первого элемента из массива и сохранение его в константе

anotherArrayOfIntegers // Результат после удаления первого элемента

anotherArrayOfIntegers += [10]

anotherArrayOfIntegers.remove(at: 1) // Удаление значения по индексу

anotherArrayOfIntegers // Результат после удаления значение по индексу

anotherArrayOfIntegers.count // Количество элементов массива

anotherArrayOfIntegers.removeAll() // Удаление всех элементов массива

arrayOfIntegers = [] // Обнуление массива путём присваивания ему пустого массиву

arrayOfIntegers = [10, 20, 40]

arrayOfIntegers[2] = 30 // Замена значения по индексу 2 на новое значение

arrayOfIntegers // Результат после замены

//: ### Использование логического свойства isEmpty

anotherArrayOfIntegers = [1, 2, 3]

if !anotherArrayOfIntegers.isEmpty {
    print(anotherArrayOfIntegers)
}

//: [Next](@next)
