//MARK: - У учителя есть много учеников, которые его слушают
// Наблюдатель - Создаёт механизм подписки, позволяющий одним объектам следить и реагировать на события, происходящие в других объектах.

//MARK: - Teacher

import Foundation

protocol Subject {
    func add(observer: PropertyObserver) // добавляем наблюдателя (кого то из PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String) // уведомим наблюдателей
}

class Teacher: Subject {

    // коллекция наблюдателей в единственном экземпляре
    var observerCollection = NSMutableSet()
    
    var homeTask = "" {
        didSet {
            notify(withString: homeTask) // вызываем notify -> didGet у всех наблюдателей
        }
    }

    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }

    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }

    func notify(withString string: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
}

//MARK: - Pupil

protocol PropertyObserver { // наблюдатель
    func didGet(newTask task: String) // получено новое задание
}

class Pupil: NSObject, PropertyObserver {

    var homeTask = ""

    func didGet(newTask task: String) {
        homeTask = task
        print("new homework didGet")
    }
}

let teacher = Teacher()

let pupil1 = Pupil()
let pupil2 = Pupil()
let pupil3 = Pupil()

teacher.add(observer: pupil1)
teacher.add(observer: pupil2)
teacher.add(observer: pupil3)

teacher.homeTask = "задача #1 на странице 11"

pupil1.homeTask
pupil2.homeTask
pupil3.homeTask
