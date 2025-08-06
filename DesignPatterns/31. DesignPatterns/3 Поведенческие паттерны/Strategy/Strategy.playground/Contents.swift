//MARK: - Определяет семейство схожих алгоритмов и помещает каждый из них в собственный класс, после чего алгоритмы можно взаимозаменять прямо во время исполнения программы.
// Кажды человек умеет бегать, но не каждый умеет нырять и плавать (уровень умений тоже может быть разный)
// Сделаем уникальных людей

//MARK: - SwimBehavior

protocol SwimBehavior {
    func swim()
}
class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swimming")
    }
}
class MiddleSwimmer: SwimBehavior {
    func swim() {
        print("MiddleSwimmer swimming")
    }
}
class NonSwimmer: SwimBehavior {
    func swim() {
        print("non-swimming")
    }
}

//MARK: - DiveBehavior

protocol DiveBehavior {
    func dive()
}
class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("professional diving")
    }
}
class NewbieDiver: DiveBehavior { // новичек
    func dive() {
        print("newbie diving")
    }
}
class NonDiver: DiveBehavior {
    func dive() {
        print("non-diving")
    }
}

//MARK: - Human with behaviors

class Human {

    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!

    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
    
    func performSwim() {
        swimBehavior.swim()
    }
    func performDive() {
        diveBehavior.dive()
    }
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    func run() {
        print("running")
    }
}

// - - - - - //

let human = Human(swimBehavior: NonSwimmer(), diveBehavior: NewbieDiver())
human.performDive()
human.performSwim()

human.setSwimBehavior(sb: ProfessionalSwimmer())
human.performDive()
human.performSwim()









