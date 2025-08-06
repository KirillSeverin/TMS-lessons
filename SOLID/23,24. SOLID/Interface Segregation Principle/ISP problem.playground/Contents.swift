import UIKit

class Bird {
    func fly() { }
    func swim() { }
}

class Duck: Bird {
    override func fly() {
        print("i can fly a lot")
    }
    override func swim() {
        print("i can swim a lot")
    }
}

//let bird1 = Bird() // Penguin don't work
//bird1.fly()
//bird1.swim()

let duck1 = Duck()
duck1.fly()
duck1.swim()

class Penguin: Bird {
    override func fly() {
        fatalError()
    }
    override func swim() {
        print("swim is a life")
    }
}

let penguin = Penguin() // Penguin don't work
penguin.fly()
penguin.swim()
