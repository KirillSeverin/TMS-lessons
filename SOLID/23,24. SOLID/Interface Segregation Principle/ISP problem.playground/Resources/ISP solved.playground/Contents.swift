import UIKit

protocol Birds {
    func fly()
    func swim()
}

/*
 Удаляем полностью класс Bird / замещаем ее на протокол Birds тк оба заставляют дочечние классы реализовывать fly + swim
 */

//class Bird: Birds {
//    func fly() {
//
//    }
//
//    func swim() {
//
//    }
//
//}
//
//class Duck: Bird {
//    override func fly() {
//        print("i can fly a lot")
//    }
//    override func swim() {
//        print("i can swim a lot")
//    }
//}
//
//class Penguin: Bird {
//    override func fly() {
//        fatalError()
//    }
//    override func swim() {
//        print("swim is a life")
//    }
//}

protocol Flyable {
    func fly()
}

protocol Swimable {
    func swim()
}

class Duck: Flyable, Swimable {
    func fly() {
        print("i can fly a lot")
    }
    func swim() {
        print("i can swim a lot")
    }
}

class Penguin: Swimable {
    func swim() {
        print("swim is my life")
    }
}

let penguin1 = Penguin()
penguin1.swim()

let duck1 = Duck()
duck1.fly()
duck1.swim()
