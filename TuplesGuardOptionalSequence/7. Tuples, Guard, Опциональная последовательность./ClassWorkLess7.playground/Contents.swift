import UIKit

//: # Lesson 7

/*: # 1.Кортежи (tuples)
 >Суть в том что 1 св-ву можно присвоить несколько значений, но в отличие от коллекций эти значения могут быть разных типов. Значения упорядочены.
 */

/*:
 
 (valueOne, ValueTwo, ValueThree,…)
 
 */

var currentWeatherTuples = (22, "Sunny") // Declaration: var currentWeatherTuples: (Int, String)
var currentWeatherTuplesTest: (Int, String)
currentWeatherTuplesTest = (25, "Windy")

class Weather {
    var currentWeather: (Int, String)
    
    init(currentWeather: (Int, String)) {
        self.currentWeather = currentWeather
    }
    // что будет если init убрать?
}

let weather = Weather(currentWeather: (15, "Cloudy"))
// что будет если weather поменять на var?
weather.currentWeather

//: ### Получение доступа к элементам
// поменяем зн-я у weather
weather.currentWeather.0 = 24
weather.currentWeather.1 = "Rainy"
// что будет если currentWeather будет let?

weather.currentWeather

let (temperature, atmos) = weather.currentWeather
temperature
atmos

// можно легко создать св-ва из элементов кортежа
let (tempr, _) = weather.currentWeather
tempr

//: ### Именование элементов кортежа
// можно и нужно добавлять имена св-в
var currentWeather = (temp: 21, atmos: "Fog", windSpeed: 6)
// почему я смог создать currentWeather(имя задвоено)?
currentWeather.temp
currentWeather.atmos
currentWeather.windSpeed

//: ### Массовое присвоение значений

let numberOne = 1
let numberTwo = 2
let numberThree = 3

let (x, y, z) = (1, 2, 3) // создание сразу 3 констант

//: ##  Примение

//: ### 1. Применение через for:

var cityTemp = ["Minsk": 25, "Moscow": 20, "Kiev": 30]

for (city, temp) in cityTemp {
    print("Температура в городе \(city) составляет \(temp) градусов Цельсия")
}

// А что если будет 1 константа в for ___ in ?

//: ### 2. Примение через возвращаемый параметр ф-ции

func getTemp(in city: String) -> (city: String, temp: Int) {
    let temp = Int.random(in: 20...30)
    return (city, temp)
}

let (city, temp) = getTemp(in: "Brest")
print("Температура в городе \(city) составляет \(temp) градусов Цельсия")

let tempInCity = getTemp(in: "Grodno")
// Declaration: Посмотрим)))
print("Температура в городе \(tempInCity.city) составляет \(tempInCity.temp) градусов Цельсия")

//: # 2.Guard

/*:   ### Воспроизведем проблему которую Guard решает

     Cоздим регистрацию пользователя на каком-то сервисе для взрослых
   
     поля заполняем последовательно, поля вводы активизируются после ввода предыдущего значения
*/
 
func createNewUser(name: String,
                   surname: String,
                   email: String,
                   age: Int) {
    if name != "" {
        print(name)
        if surname != "" {
            print(surname)
            if email != "" {
                print(email)
                if age >= 18 {
                    print("\(name) \(surname), Welcome!")
                } else {
                    print("Adults only") // Только для взрослых
                }
            } else {
                print("Enter your email")
            }
        } else {
            print("Enter your surname")
        }
    } else {
        print("Enter your name")
    }
}
// Что тут не так?

var name = "Evgeny"
var surname = "Martynov"
var email = "progmev@gmail.com"
var age = 35

print("\ncreateNewUser :")
createNewUser(name: name, surname: surname, email: email, age: age)

// Обчно это реализуется с помощью UITextField
let textField = UITextField()
textField.isEnabled = true
textField.isHidden = false

//: ### Улучшим через return

func createNewUserV2(name: String,
                     surname: String,
                     email: String,
                     age: Int) {
    
    if name == "" {
        print("Enter your name")
        return
    }
    
    print(name)
    
    if surname == "" {
        print("Enter your surname")
        return
    }
    
    print(surname)
    
    if email == "" {
        print("Enter your email")
        return
    }
    
    print(email)
    
    if age < 18 {
        print("Adults only")
        return
    }
    
    print(age)
    
    print("\(name) \(surname), Welcome!")
}

surname = ""
print("\ncreateNewUserV2 :")
createNewUserV2(name: name, surname: surname, email: email, age: age)

//: ### Попробуем решить через опционалы (?)

func createNewUserV3(name: String?,
                     surname: String?,
                     email: String?,
                     age: Int?) {
    
    if  name == nil || name?.count == 0 {
        print("Enter your name")
        return
    }
    
    if  surname == nil || surname?.count == 0 {
        print("Enter your sername")
        return
    }
    
    if  email == nil || email?.count == 0 {
        print("Enter your email")
        return
    }
    
    if  age == nil || age! < 18 {
        print("Adults only")
        return
    }
    
    print("\(name!) \(surname!), Welcome!") // тут нужно опять проверку делать на nil или safe unwrap
}

surname = "Matrynov"
age = 15
print("\ncreateNewUserV3 :")
createNewUserV3(name: name, surname: surname, email: email, age: age)
/*: ### Синтаксис guard
 
       guard condition else { return }
 
 */

func createNewUserV4(name: String?, surname: String?, email: String?, age: Int?) {
    
    guard let currentName = name, currentName.count > 0 else { return }
    guard let currentSurname = surname, currentSurname.count > 0 else { return }
    guard let currentEmail = email, currentEmail.count > 0 else { return }
    guard let currentAge = age, currentAge >= 18 else { return }
    
    print("\(currentName) \(currentSurname), Welcome!")
}

surname = "Martynov"
print("\ncreateNewUserV4 :")
createNewUserV4(name: name, surname: surname, email: email, age: age)

// А как еще ф-ю можно улучшить? Есть ли в ней смысл?

//: # 3.Опциональная последовательность

class Person {
    var age: Int?
    var residence: Residence?
}

class Residence {
    var adress: Adress?
}

class Adress {
    var buildinNumber: String?
    var streetName: String?
    var appartmentNumber: String?
}

let person = Person()

if let theRsidence = person.residence {
    if let theAdress = theRsidence.adress {
        if let theApartmentNumber = theAdress.appartmentNumber {
            print("The appartment number: \(theApartmentNumber)")
        }
    }
}

// Запишем с помощью опциональной последовательности
if let theApartmentNumber = person.residence?.adress?.appartmentNumber {
    print("The appartment number: \(theApartmentNumber)")
}

// как эту логику было бы лучше реализовать?
