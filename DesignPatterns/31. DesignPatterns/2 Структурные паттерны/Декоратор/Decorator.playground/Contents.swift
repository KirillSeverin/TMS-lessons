//MARK: - Позволяет динамически добавлять объектам новую функциональность, оборачивая их в полезные «обёртки».
// Есть много серий Porsche + много опций(у каждой) = множество вариантов

//MARK: - Porsche Panamera

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Panamera: Porsche {
    func getPrice() -> Double {
        return 125000
    }
    func getDescription() -> String {
        return "Porsche Panamera"
    }
}

class Porsche911: Porsche {
    func getPrice() -> Double {
        return 300000
    }
    func getDescription() -> String {
        return "Porsche 911"
    }
}


//MARK: -  PorscheDecorator

class PorscheDecorator: Porsche { // Абстрактный класс для добавления опций
    // авто в которое добавляем опцию
    private let decoratedPorsche: Porsche

    required init(dp: Porsche) { // required - при наследовании этот инициализатор обязателен для подкласов
        self.decoratedPorsche = dp
    }
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}

//MARK: -  ОПЦИИ

class PremiumAudioSystem: PorscheDecorator {
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    override func getPrice() -> Double {
        return super.getPrice() + 5000
    }
    override func getDescription() -> String {
        return super.getDescription() + ", with premium audio system"
    }
}

class PanoramicSunroof: PorscheDecorator {
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    override func getPrice() -> Double {
        return super.getPrice() + 20000
    }
    override func getDescription() -> String {
        return super.getDescription() + ", with panoramic sunroof"
    }
}

class LifetimeWarranty: PorscheDecorator {
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    override func getPrice() -> Double {
        return super.getPrice() + 15000
    }
    override func getDescription() -> String {
        return super.getDescription() + ", with lifetime warranty"
    }
}

// - - - - - //

var porschePanamera: Porsche = Panamera() // Porsche тип позволяет использовать разные серии
porschePanamera.getDescription()
porschePanamera.getPrice()

porschePanamera = PremiumAudioSystem(dp: porschePanamera)
porschePanamera.getDescription()
porschePanamera.getPrice()

porschePanamera = PanoramicSunroof(dp: porschePanamera)
porschePanamera.getDescription()
porschePanamera.getPrice()

porschePanamera = LifetimeWarranty(dp: porschePanamera)
porschePanamera.getDescription()
porschePanamera.getPrice()

var porsche911: Porsche = Porsche911() // Porsche тип позволяет использовать разные серии
porsche911.getDescription()
porsche911.getPrice()

porsche911 = PremiumAudioSystem(dp: porsche911)
porsche911.getDescription()
porsche911.getPrice()

porsche911 = PanoramicSunroof(dp: porsche911)
porsche911.getDescription()
porsche911.getPrice()

porsche911 = LifetimeWarranty(dp: porsche911)
porsche911.getDescription()
porsche911.getPrice()
