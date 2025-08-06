import Foundation

/*:
 ### Задание 3
 3.1 Решите первую половину второго задания из прошлого урока, используя конструкцию if-else для расчета количества прожитых годов, месяцев, дней, часов и секунд
 */

let dayOfBirth = 17
let monthOfBirth = 1
let yearOfBirth = 2019

var currentDay = 18
var currentMonth = 1
var currentYear = 2020

let secondsPerDay = 60 * 60 * 24 //Количество секунд в сутках
let daysPerMonth = 30 //Количество дней в месяце
let monthPerYear = 12 //Количество месяцев в году

var yearsFromBirth = 0 //Количество полных лет
var monthFromBirth = 0 //Количество полных месяцев
var daysFromBirth = 0 //Количество дней с момента рождения
var secondsFromBirth = 0 // Количество секунд

// день рождения наступил?
let birthdayIsDone = currentMonth >= monthOfBirth && currentDay >= dayOfBirth

if  birthdayIsDone {
    yearsFromBirth = currentYear - yearOfBirth
    monthFromBirth = (yearsFromBirth * monthPerYear) + (currentMonth - monthOfBirth)
    daysFromBirth = (monthFromBirth * daysPerMonth) + (currentDay - dayOfBirth)
} else {
    yearsFromBirth = currentYear - yearOfBirth - 1
    monthFromBirth = (yearsFromBirth + 1) * monthPerYear + (currentMonth - monthOfBirth)
    daysFromBirth = (monthFromBirth * daysPerMonth) + (currentDay - dayOfBirth)
    
    if currentDay < dayOfBirth {
        monthFromBirth -= 1
    }
}

secondsFromBirth = daysFromBirth * secondsPerDay // Количество секунд

print("\(yearsFromBirth) years, \(monthFromBirth) months, \(daysFromBirth) days and \(secondsFromBirth) seconds have passed since my birth")

/*:
3.2 Решите вторую половину задания второго задания из прошлого урока, используя конструкцию switch и оператор диапазона для расчета квартала в котором вы родились
*/


switch monthOfBirth {

case 1...3:
    print("I was born in the first quarter")
case 4...6:
    print("I was born in the second quarter")
case 7...9:
    print("I was born in the third quarter")
case 10...12:
    print("I was born in the fourth quarter")
default:
    break
}

/*
 case 0...1:   - нулевого не существует
 case 1, 2, 3: - нужно использовать диапазоны
 case 7...9    - и сразу дефолт тоже не правильно
*/

//: [Ранее: Задание 2](@previous)  |  задание 3 из 11  |  [Далее: Задание 4](@next)
