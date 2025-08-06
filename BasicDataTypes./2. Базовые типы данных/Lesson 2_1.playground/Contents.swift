/*:
 ## Lesson 2
 */
import UIKit
import SwiftUI

// Фреймворк(библиотека) для работы с элементами пользовательского интерфейса User Interface Kit(набор)
// Набор элементов пользовательского интефейса
// Был самым высокоуровневым фреймворком до SwiftUI.
// Принцип матрешки
// Базовый фреймворк -> Foundetion (фреймворк для работы с массивы, циклы...) -> UIKit -> SwiftUI
// Детально все будем разбирать на ООП и реальных проектах с интерфейсами)


//MARK: - Comment (Title)
// - коментарий 1
/* коментарий 2 */
// cmd + /
//TODO: - To do....


//MARK: - MarkDown синтаксис (Editor -> Show Raw Markup)

//:# Tile 0

/*:#Title 01
 >Notes
 */

/*:
 # Title 1
 >  Тут будет **жирный текск**, а так же *курсив*
 */
//: ## Title 2
//: ### Title 3

/*:
 ## Переменные
 > Переменная это объект, который хранит в себе определенные данные. В качестве данных могут выступать какие то значения или другие объекты.
 */

/*:
 > Футбол - это командный вид спорта с мячом, в котором целью является забить мяч в ворота соперника. Футбол это не просто вид спорта, футбол - это стиль жизни, футбол - это философия. Футбол, вид спорта для сильных духом и целеустремленных людей. Я люблю футбол. Футбол мой любимый вид спорта!
 */

 var teamSport /*уникальное имя для поиска ячейки памяти (CamelCase)*/ = "Футбол" /*значение*/
 
 // интерполяция ->
 print("\(teamSport) - это командный вид спорта с мячом, в котором целью является забить мяч в ворота соперника. \(teamSport) это не просто вид спорта, \(teamSport) - это стиль жизни, \(teamSport) - это философия. \(teamSport), вид спорта для сильных духом и целеустремленных людей. Я люблю \(teamSport). \(teamSport) мой любимый вид спорта!\n")
 
 teamSport = "Американский футбол"
 
 print("\(teamSport) - это командный вид спорта с мячом, в котором целью является забить мяч в ворота соперника. \(teamSport) это не просто вид спорта, \(teamSport) - это стиль жизни, \(teamSport) - это философия. \(teamSport), вид спорта для сильных духом и целеустремленных людей. Я люблю \(teamSport). \(teamSport) мой любимый вид спорта!\n")
 
 // ЗАКОНОМЕРНОСТИ - ТО ЧТО ПРОГРАММИСТ ВИДЕТ И УЛУЧШАЕТ
 // Дальше используем ф-ции)))

/*:
 ## Константы
 >  ставим по умолчанию - потом можно исправить)
 */

let name: String = "Evgeniy"
 print("My name is \(name)")

//name = "Boris"

/*:
 # Строгая типизация
 */

//teamSport = 10

/*:
 # Базовые типы в Swift.
 */
/*:
 ## Строковые типы - String
 */

var myFriend: String
myFriend = "Nikolay"
print("My friend name is \(myFriend)")

/*:
 ## Числовые типы
 ### Int
 */

 var age: Int  // Обявление переменной типа Int без инициализации (возможно только в PG) // Зарезервинована память под переменную
 age = 35      // Установили значение в переменную
 print("My name is \(name), i am \(age) old")



print(Int.max)
print(Int.min)
 
print(UInt.max)
print(UInt.min)
 
print(Int8.max)
print(Int8.min)

print(UInt8.max)
print(UInt8.min)
 
 var uint8: UInt8
 uint8 = 255
 //uint8 += 2
 print(uint8)

/*:
 ### Double
 >  64-битное число с плавающей точкой
 */

 var someNumber = 10.9

/*:
 ### Float
 >  32-битное число с плавающей точкой
 */

var someFloat:Float = 0.0
 
 someFloat = 121.123444
 someFloat = 1221.123444
 someFloat = 12321.123444
 someFloat = 123421.123444
 someFloat = 1234521.123444

/*:
 ## Булево значения
 */

let someBool: Bool = true

/*:
 ## Приведение типов
 */

let constDouble = Double(age)
let castIntToDouble = Double(age) + someNumber // Новая константа с типом Double
let constInt = Int(someNumber)
let castDoubleToInt = age + Int(someNumber) // Новая константа с типом Int
 
let myAge = "I am "
let constString = String(age)
let castIntToString = myAge + constString + " old" // Приведение числовых значений к строковым данным
 
 let someString = "10"
 let castStringToInt = age + Int(someString)! //Приведение строковых данных к числовым значениям



