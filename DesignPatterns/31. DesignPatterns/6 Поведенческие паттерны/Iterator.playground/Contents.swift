/*
Итератор — это поведенческий паттерн, позволяющий последовательно обходить сложную коллекцию, без раскрытия деталей её реализации.

Благодаря Итератору, клиент может обходить разные коллекции одним и тем же способом, используя единый интерфейс итераторов.

Применимость: Паттерн можно часто встретить в Swift-коде, особенно в программах, работающих с разными типами коллекций, и где требуется обход разных сущностей.
*/

// Определение "Итератор" — интерфейс, предоставляющий доступ к элементам коллекции и навигацию по ним.

//MARK: - пример в array


let array = [1,2,3,4,5]

for item in array {
    print(item)
}

var iterator = array.makeIterator()
while let item = iterator.next() {
    print(item)
}


//MARK: - Driver

class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

//MARK: - Car

class Car {
    // история владельцев
    private let drivers = [Driver(isGood: false, name: "name1"),
                           Driver(isGood: true, name: "name2"),
                           Driver(isGood: false, name: "name3"),
                           Driver(isGood: true, name: "name4")]
    // итератор
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

extension Car: Sequence { // Sequence - Тип, обеспечивающий последовательный, повторяющийся доступ к его элементам.
    // реализуем протокольную ф-ю makeIterator
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

//MARK: - Iterator

protocol BasicIterator: IteratorProtocol { // IteratorProtocol - Тип, который предоставляет значения последовательности по одному за раз. (должны реализовать next)
    init(drivers: [Driver])
    func allDrivers() -> [Driver]
}

class GoodDriverIterator: BasicIterator {
    
    private let drivers: [Driver] // водители
    private var current = 0       // текущий водитель
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver } // берем только isGoodDriver
    }
    
    // протокольная ф-я
    func next() -> Driver? {
        defer { current += 1 } // defer - выполняется в самом конце блока
        return drivers.count > current ? drivers[current] : nil // если текущий элемент в рамках массива -> возвращаем этот элемент / в противном случае nil
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
}

//MARK: - Примеры

let car = Car()
let goodDriver = car.goodDriverIterator.next()

car.goodDriverIterator.next()
car.goodDriverIterator.next()
car.goodDriverIterator.next()

for driver in car {
    print(driver.name)
}

let goodDriverIteratorViaSequence = car.makeIterator().allDrivers()
