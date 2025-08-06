//
//  ViewController.swift
//  MemotyApp
//
//  Created by Martynov Evgeny on 22.03.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*
        let person = "Evgeny"
        let age = 35
        label.text = "Name \(person), age: \(age)"
        */

        /*
        var first: MyClass? = MyClass()
        var second = first
        var third = first

        first = nil
        second = nil
        third = nil
        */
        
        /*
        var mother: Parent?
        mother = Parent()
        mother = nil
        */
        
        /*
        var evgeny: Person?
        var teacher: Job?

        evgeny = Person()
        teacher = Job()

        evgeny?.job = teacher
        teacher?.person = evgeny

        evgeny = nil
        teacher = nil
        */
    }
}
// - - -
class MyClass {
    var someNumber = 10
    deinit {
        print("MyClass will be dealocated")
    }
}
// - - -
class Parent {
    var child: Child = Child()
    deinit {
        print("Parent will be dealocated")
    }
}

class Child {
    deinit {
        print("Child will be dealocated")
    }
}
// - - -
//PARENT
class Person {
    var job: Job?
    deinit {
        print("Person will be dealocated")
    }
}
//CHILD
class Job {
    //var person: Person?
    weak var person: Person?
    deinit {
        print("Job will be dealocated")
    }
}

