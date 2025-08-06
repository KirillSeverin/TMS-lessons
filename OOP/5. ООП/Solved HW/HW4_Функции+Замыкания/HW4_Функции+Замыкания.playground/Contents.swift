import UIKit

//: ## Home Work 4 (Функции+Замыкания)
/*:
 ### Задание 1
 Создайте словарь, который содержит результаты игр спортивной команды в чемпионате (например по хоккею). Ключом словаря должно быть название команды соперника, а в качестве значения должен быть массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр. Выглядить это должно примерно следующим образом:
 
 - Игра с Салават Юлаев - 3:6
 
 - Игра с Салават Юлаев - 5:5
 
 - Игра с Авангард - 2:1
 
 - Игра с Авангард - 2:3
 
 - Игра с АкБарс - 3:3
 
 - Игра с АкБарс - 1:2
 */

// словарь, который содержит результаты игр
let resultsOfGames = [
    "Авангард"      : ["2:1","2:3"],
    "Салават Юлаев" : ["3:6","5:5"],
    "Акбарс"        : ["3:3","1:2"]
]

for (teamName, results) in resultsOfGames {
    for result in results {
        print("Игра с \(teamName) - \(result)")
    }
}

/*:
 ### Задание 2
 Создайте функцию которая принимает в качестве аргументов день, месяц и год вашего рождения и делает расчет полных прожитых вами дней, месяцев и лет с момента вашего рождения. При вызове функции на консоль должно выходить то же самое сообщение, что и в предыдущих заданиях
 */

func calculateDate(from day: Int, _ month: Int, _ year: Int) {
    
    let currentDate = Date()
    
    var dateComponents = DateComponents()
    dateComponents.day = day
    dateComponents.month = month
    dateComponents.year = year
    
    let userCalendar = Calendar.current
    
    if let someDateTime = userCalendar.date(from: dateComponents),
       let dayPassed = userCalendar.dateComponents([.day], from: someDateTime, to: currentDate).day,
       let monthPassed = userCalendar.dateComponents([.month], from: someDateTime, to: currentDate).month,
       let yearPassed = userCalendar.dateComponents([.year], from: someDateTime, to: currentDate).year {
        print("\(yearPassed) years, \(monthPassed) months and \(dayPassed) days have passed since")
    } else {
        print("Calculation is not possible")
    }
}

calculateDate(from: 9, 7, 2000)

/*:
 ### Задание 3
 3.1 Создайте функцию, которая считает общую сумму денег, хранящихся в кошельке. В кошельке имеются купюры различного достоинства от 50 до 5000 рублей
 */

func calculationCash(inWallet wallet: [Int]) -> Int {
    var totalCash = 0
    for banknote in wallet {
        totalCash += banknote
    }
    return totalCash
}
calculationCash(inWallet: [100,100,20,10,10,10,70,120])
//: 3.2 Заполните массив различными купюрами и подсчитайте общую сумму

var wallet = [50, 100, 100, 500, 50, 1000, 5000, 50, 100]

calculationCash(inWallet: wallet)

/*:
 ### Задание 4
 4.1 Создайте функцию, которая определяет является ли число четным или нет. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`. Подумайте над названием функции, оно должно быть ёмким и в то же время не очень длинным
 */

func isEvenNumber(_ number: Int) -> Bool {
    return number % 2 == 0
}

isEvenNumber(16)

/*:
 4.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение. Так же подумайте над названием функции
 */

func isDivisibleByThree(_ number: Int) -> Bool {
    return number % 3 == 0
}
isDivisibleByThree(15)
/*:
 4.3 Создайте функцию, которая создает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен определять пользователь при вызове функции. Если хотите усложить задание, то пусть данная функция создает массив сулчайных чисел в заданном интервале с уникальными значениями
 */


func createArray(from start: Int, to end: Int) -> [Int] {
    var array = [Int]()
    for count in start...end {
        array.append(count)
    }
    return array.shuffled() // если хотим перемешать .shuffled()
}

// Создание несортированного массива
func createUnsortedArray(from start: Int, to end: Int) -> [Int] {
    var setOfInt = Set<Int>()
    for count in start...end {
        setOfInt.insert(count)
    }
    return Array(setOfInt) // если хотим отсортировать .sorted()
}

let sortedArray = createArray(from: 1, to: 100)
let unsortedArray = createUnsortedArray(from: 1, to: 100)

/*:
 4.4 Создайте массив чисел от *1* до *100*, используя для этого вышесозданную функцию
 */

var array = createArray(from: 1, to: 100)
//array.sorted()  

/*:
 > Данный материал выходи за рамки пройденного материала
 
 4.5 Удалите из этого массива сначала все четные числа, а затем и числа, которые делятся на *3*, используя для этого функции из задания **3.1** и **3.2**. Есть несоколько вариантов решения, в том числе с использованием функии `filter()`
 */
// ошибка в задании 4.1 и 4.2

// Удаление значения по индексу
for number in array {
    if isDivisibleByThree(number) {
        if let index = array.firstIndex(of: number) {
            array.remove(at: index) // удаление по индексу
        }
    }
}

array

// Фильтруем, оставляя в массиве все нечетные значения
array = array.filter { !isEvenNumber($0) }

array

array = createArray(from: 1, to: 100)

// Удаление все элементов, удовлетворяющих усвлоию
array.removeAll(where: isEvenNumber)
array.removeAll(where: isDivisibleByThree)

array

array = createArray(from: 1, to: 100)

// Удалению по индексу в обратном порядке
for number in array.reversed() { // reversed() преворачивает массив
    if !isEvenNumber(number) {
        array.remove(at: number)
    }
}

array

/*:
 4.6 Создайте отдельные функции для удаления всех четных чисел из массива и чисел, которые делятся на *3*. Для определения четного числа и числа которое делится на *3* используейте ранее созданные функции
 */

func deleteMiltiple(array:[Int], clouser: (Int) -> Bool) -> [Int] {
    var array = array
    for number in array {
        if clouser(number) {
            if let index = array.firstIndex(of: number) {
                array.remove(at: index)
            }
        }
    }
    return array
}

func deleteMiltipleVerTwo(array:[Int], clouser: (Int) -> Bool) -> [Int] {
    return array.filter { !clouser($0) }
}

array = createArray(from: 1, to: 100)

let oddNumbers = deleteMiltipleVerTwo(array: array, clouser: isEvenNumber)

let divisibleByTree = deleteMiltipleVerTwo(array: array, clouser: isDivisibleByThree)

