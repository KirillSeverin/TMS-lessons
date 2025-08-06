//: [Previous](@previous)

import Foundation

//: ## Словари
//: > Неупорядоченные коллекции, которые хранят в себе пары «ключ-значение». Тип ключа словаря может отличаться от типа значения. При этом сами ключи и значения должны быть одного типа

var someStringDictionaty = Dictionary<String, String>() //Полная форма записи словаря
var morStringDictionary =  [Int: String]()
var anotherSomeDictionary: [Int: String] = [:] // Сокращенная форма записи словаря

var carWashQueue = ["E095BA": "Red Corola", "X127MT": "White BMW X6"] // Инициализация словаря с данными

carWashQueue["E095BA"] = "Red Camry" // Изменение значения для ключа

let oldValue = carWashQueue.updateValue("Gray BMW X6", forKey: "X127MT") // Изменение значения с сохранением старого значения

carWashQueue["M560PA"] = "Green Chevy Niva" // Добавление новой пары ключ-значение

carWashQueue

carWashQueue.removeValue(forKey: "E095BA") // Удаление значения по ключу с сохранением значения

carWashQueue["X127MT"] = nil

print(carWashQueue["1123123"])

carWashQueue

carWashQueue.count // Количество пар в словаре

carWashQueue.removeAll() // Удаление всех значений

//: [Next](@next)
