import UIKit

//: # Lesson 6

//: ## Перечисления

// Устновка будильника в зависимости от дня недели

var someDay = "Monday"

func setupAlarmWithoutEnum() {
    if someDay == "Monday" || someDay == "Tuesday" {
        print("To set alarm fot 8 am")
    } else {
        print("Alarm not set")
    }
}

setupAlarmWithoutEnum()
someDay = "tuesday"
setupAlarmWithoutEnum() // Что буде?

/*:
 > Перечисления представляют из себя набор значений определенного типа данных. Позволяющие взаимодействовать с этими значениями
 */

/*:
 enum EnumerationName {
 case enumeration
 }
 
 */

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thuesday
    case friday
    case saturday
    case sunday
}

var weekday = Weekday.monday // var weekday: Weekday = .monday

func setupAlarmWithEnum() {
    if weekday == .monday || weekday == .tuesday {
        print("To set alarm fot 8 am")
    } else {
        print("Alarm not set")
    }
}

setupAlarmWithEnum()
weekday = .tuesday
setupAlarmWithEnum()
weekday = .friday
setupAlarmWithEnum()

//: ### Использование инструкции Switch

func setupAlarmWithSwitch() {
    switch weekday {
    case .monday:
        print("To set alarm fot 8 am")
    case .tuesday:
        print("To set alarm fot 8:30 am")
    case .wednesday:
        print("To set alarm fot 8:30 am")
    case .thuesday:
        print("To set alarm fot 7:30 am")
    case .friday:
        print("Yay! The last day of the week")
    default:
        print("Alarm not set")
    }
}

setupAlarmWithSwitch()
weekday = .tuesday
setupAlarmWithSwitch()
weekday = .friday
setupAlarmWithSwitch()

//: ### Исходные значения

enum WeekdayWithString: String {
    
    case monday = "To set the alarm for 8 am"
    case tuesday = "To set the alarm for 8:30 am"
    case wednesday = "To set the alarm for 9 am"
    case thursday = "To set the alarm for 7:30 am"
    case friday = "Yay! The last day of the week!"
    case saturday
    case sunday
}

var weekdayWithString = WeekdayWithString.monday
print(weekdayWithString.rawValue)
weekdayWithString = .saturday
print(weekdayWithString.rawValue) // Что тут будет?
// А если Int то что будет?

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let somePlanet = Planet.mars
print("Earh is the \(somePlanet.rawValue) planet from the sun")

//: ### Инициализация

// возможная планета
if let possiblePlanet = Planet(rawValue: 7) { // зачем такое присвоение?
    print("The seventh planet is \(possiblePlanet)")
}

//: ### Связанные значения (ассоциированные параметры)

enum Weekdays {
    case workday(String, Int)
    case weekend(String)
}

func setAlarm(weekdays: Weekdays) {
    switch weekdays {
    case let .workday(message, time):
        print("\(message) \(time)")
    case let .weekend(weekendMessage):
        print("\(weekendMessage)")
    }
}

var weekdays = Weekdays.workday("Set alarm to", 8)
setAlarm(weekdays: weekdays)
weekdays = .weekend("Have a nice weekend!")
setAlarm(weekdays: weekdays)


//: [Next](@next)
