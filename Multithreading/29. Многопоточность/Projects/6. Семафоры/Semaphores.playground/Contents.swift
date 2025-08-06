import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// создаем очередь
let queue = DispatchQueue(label: "queueSemaphores", attributes: .concurrent) // concurrent - ||

// создаем semaphore
// value - количество потоков которое мы разрешим пройти через секцию
let semaphore = DispatchSemaphore(value: 2)

queue.async {
    semaphore.wait(timeout: .distantFuture) // distantFuture ждем пока не получим сигнал
    Thread.sleep(forTimeInterval: 4) // усыпим поток (имитируем работу на 4 секунды)
    print("Block 1")
    semaphore.signal() // подаем сигнал что следующий поток может зайти
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    Thread.sleep(forTimeInterval: 2)
    print("Block 2")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 3")
    semaphore.signal()
}

queue.async {
    semaphore.wait(timeout: .distantFuture)
    print("Block 4")
    semaphore.signal()
}















