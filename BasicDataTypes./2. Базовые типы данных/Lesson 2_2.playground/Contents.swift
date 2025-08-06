/*: ## Базовые операторы
 >**Унарные операторы** - применяются к 1 величине (-3, !a).
 **Бинарные операторы** - применяются к 2-м величинам (2+3).
 **Тернарный оператор** (изучим на следующем уроке) - применяются к 3-м величинам (a ? b : c).
 **Операнды** - величины к которым применяются операторы.
 */
import UIKit
//: ### Арифметические операторы:

var a = 8
var b = 4
// Короткие названия переменных не допустимы.

a + b
a - b
a * b
a / b

/*: ### Оператор остатка от деления:
 >a = (b * множитель) + остаток
 */

// одинаковый результат у:
a % b    // 9 = (4 * 2) + 1
a % -b   // знак отбрасывается
// отрицательный результат
-a % b   // знак остается

a.isMultiple(of: b) // со swift 5


//: ### Оператор присваивания:

a = 5
b = 10

print("a равно \(a)")
print("b равно \(b)")

let c = a + b
print("c равно \(c)")

a = b
print("a равно \(a)")
print("b равно \(b)")

a = a+b
a += b
a = a-b
a -= b
a *= b
a /= b


//: ### Операторы сравнения:

let constAB = (a == b) // true
print(constAB)
a != b // false
a > b  // false
a < b  // false
a >= b // true
a <= b // true

/*: #### Операторы диапазона
 > диапазон значений от и до
 */
/*: ##### Оператор замкнутого диапазона
 > (a...b) определяет диапазон значений, который идет от a до b включая сами значения a и b
 */
/*: ##### Оператор полузамкнутого диапазона
 > (a..<b) задает диапазон от a до b, исключая значение b
 */
/*: ##### Односторонние диапазоны
 > (a...) - выполнение до конца возможных значений (легко поймем когда изучим массивы)
 */

//: ### Оператор логического НЕ:

let accessDeniedMessege = "ACCESS DENIED"
let welcomeMessage = "Welcome!"

let allowedEntry = false // введенный код двери -> Разрешение на вход отсутствует

if !allowedEntry {
    print(accessDeniedMessege)
} else {
    print("False")
}

//: ### Оператор логического И:

var enteredDoorCode = false    // введенный код двери
var passedRetinaScan = true // пройдено сканирование сетчатки глаза

if enteredDoorCode || passedRetinaScan {
    print(welcomeMessage)
} else {
    print(accessDeniedMessege)
}

//: ### Оператор логического ИЛИ:

var hasDoorKey = false            // имеет ключ от двери
var knowsOverridePassword = true  // знает пароль переопределения

if hasDoorKey || knowsOverridePassword {
    print(welcomeMessage)
} else {
    print(accessDeniedMessege)
}

// Комбинирование логических операторов

enteredDoorCode = true
passedRetinaScan = false
hasDoorKey = false

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print(welcomeMessage)
} else {
    print(accessDeniedMessege)
}
 
//: ### Строки и символы:

 let name = "Evgeny"
 let surname = "Martynov"
 var email = ""


//: ### Конкатенация строк:

let fullName = name + " " + surname
var myName = "My name is "
myName.count
for index in myName.enumerated() {
    print(index)
    
}

//myName = myName + fullName
myName += fullName

let exclamationMark: Character = "!"

myName.append(exclamationMark)
myName.append(exclamationMark)

//: ### Интерполяция строк

let lessonNumber = 2
let numberOfLessons = 8

let aboutCourse = """
 Мы изучаем курс "Основы программирования на Swift"
 Сейчес у нас урок номер \(lessonNumber)
 и до окончания курса на осталось \(numberOfLessons - lessonNumber) уроков
 Автор и ведущий курса \(name) \(surname)
 """ // многострочный литерал строки
print(aboutCourse)

