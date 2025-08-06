import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// создаем первый блок
// qos - Качество обслуживания или приоритет выполнения, применяемый к задачам.
// utility - Класс качества обслуживания для задач, которые пользователь не отслеживает активно.
// detached - оторван из контекста
let workItem = DispatchWorkItem(qos: .utility, flags: .detached) {
    print("Работает workitem")
}

// выполним workItem
//workItem.perform()

// вызовем workItem в очереди
let queue = DispatchQueue(label: "queueWithDispatchWorkItem")

// асинхронно в queue отправили workItem через 1 сек
queue.asyncAfter(deadline: .now() + 1, execute: workItem)

// добавили notify
workItem.notify(queue: .main) {
    print("workitem is completed!")
}

workItem.isCancelled
workItem.cancel()
workItem.isCancelled

// код далее не выполняем пока workItem не будет выполнен
workItem.wait()













