//MARK: - Порождающий паттерн - помогает создавать объекты

//MARK: - Условие: У нас есть большие и маленькие легковые машины и грузовики.
//MARK: - Работа: Фабрики будут создавать объекты по принципу их размеров

//MARK: - Cars

protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("drive a little car")
    }
}

class BigSizeCar: Car {
    func drive() {
        print("drive a big car")
    }
}

//MARK: - Buses

protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("drive a little bus")
    }
}

class BigSizeBus: Bus {
    func drive() {
        print("drive a big bus")
    }
}

//MARK: - Factory

protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

class LittleSizeFactory: Factory {
    func produceBus() -> Bus {
        print("Little bus is created")
        return LittleSizeBus()
    }
    func produceCar() -> Car {
        print("Little car is created")
        return LittleSizeCar()
    }
}

class BigSizeFactory: Factory {
    func produceBus() -> Bus {
        print("Big bus is created")
        return BigSizeBus()
    }
    func produceCar() -> Car {
        print("Big car is creates")
        return BigSizeCar()
    }
}

let littleFactory = LittleSizeFactory()
littleFactory.produceCar()

let BigFactory = BigSizeFactory()
BigFactory.produceBus()

//MARK: Применение - общие наcтройки интерфейсов в приложении
