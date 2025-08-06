import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
// продолжаем вычисления после завершения работы основного потока

// создаем очередь в которой будем работать
let queue = DispatchQueue(label: "queueLabel", attributes: .concurrent)
// создаем группу в которую поместим queue
let firstGroup = DispatchGroup()
let secondGroup = DispatchGroup()

//MARK: - notify for both Groups

// добавляем notify (вызывается при окончании работы)
firstGroup.notify(queue: .main) {
    print("Все закончено в группе: firstGroup")
}
secondGroup.notify(queue: .main) {
    print("Все закончено в группе: secondGroup")
}

//MARK: - firstGroup

// добавляем код в очередь и в группу
queue.async(group: firstGroup) {
    for i in 0...10 {
        if i == 10 {
            print(i)
        }
    }
}

// дублируем код
queue.async(group: firstGroup) {
    for i in 0...20 {
        if i == 20 {
            print(i)
        }
    }
}

//MARK: - secondGroup

/*
 Группа содержит потоко-безопасный внутренний счетчик, который автоматически увеличивается при добавлении задания в группу с помощью метода async (group: group). Когда какое-то задание выполняется, то счетчик уменьшается на единицу и нам гарантируют, что блок обратного вызова будет вызван после завершения всех долговременных операций.

 Если в вашей группе есть не только синхронные операции, но и асинхронные, то потокобезопасным счетчиком можно управлять вручную: метод enter() увеличивает счетчик, а метод leave() уменьшает.
 */

secondGroup.enter()
queue.async(group: secondGroup) {
    for i in 0...30 {
        if i == 30 { // проверка и выход
            print(i)
            //sleep(2)
            secondGroup.leave() // выходим из группы
        }
    }
}

// проверяем через 1 сек выполнение secondGroup
let result = secondGroup.wait(timeout: .now() + 1)
print(result)

print("Последний print")

//MARK: - Waits

// выполнение кода ниже secondGroup.wait() не будет пока не будет завершена работа secondGroup
firstGroup.wait()
secondGroup.wait()

print("Самый последний print")
