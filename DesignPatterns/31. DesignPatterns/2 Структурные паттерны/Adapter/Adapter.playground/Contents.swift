//MARK: Адаптер - Позволяет объектам с несовместимыми интерфейсами работать вместе.
// (Пример с розеткой и адаптером)

//MARK: - SimpleCar (объект который мы подстраиваем)

class SimpleCar {
    func noise() -> String {
        return "SimpleCar sound"
    }
}

//MARK: - Supercar (под который пытаемся подстроиться)

protocol SupercarProtocol {
    func loudNoise() -> String
}

class Supercar: SupercarProtocol {
    func loudNoise() -> String {
        return "Supercar loudNoise"
    }
}

//MARK: - SupercarAdaptor

// adaptor
class SupercarAdaptor: SupercarProtocol {
    
    private var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func loudNoise() -> String {
        return simpleCar.noise()
    }
}

let simpleCar = SimpleCar()

let supercar = Supercar()
let supercarAdaptor = SupercarAdaptor(simpleCar: simpleCar)

supercarAdaptor.loudNoise()
supercar.loudNoise()

//MARK: - ClassWithSupercar - принимает supercar и работет с любым его типом

class ClassWithSupercar {
    
    let supercar: SupercarProtocol?
    
    init(supercar: SupercarProtocol) {
        self.supercar = supercar
    }
}

let сlassWithSupercarObj1 = ClassWithSupercar(supercar: supercar)
сlassWithSupercarObj1.supercar?.loudNoise()

let сlassWithSupercarObj2 = ClassWithSupercar(supercar: supercarAdaptor)
сlassWithSupercarObj2.supercar?.loudNoise()
