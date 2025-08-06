import UIKit
import PlaygroundSupport // что бы Playground смог работать асинхронно
PlaygroundPage.current.needsIndefiniteExecution = true // что бы Playground смог работать асинхронно по кругу (не останавливаясь)

//MARK: - ПРОБЛЕМА

/*
var array = [Int]()
// concurrentPerform (одновременное выполнение) в 20-ти потоках
DispatchQueue.concurrentPerform(iterations: 10) { (index) in
    array.append(index)
}
print("array: \(array)")
*/

//MARK: - РЕШЕНИЕ


// дженерик (класс внутри себя имеет какой-то Element)
class SafeArray<Element> {
    
    private var array = [Element]()
    // создаем очередь (concurrent -> ||) массив будет работать в этой очереди
    private let queue = DispatchQueue(label: "DispatchBarrier", attributes: .concurrent)

    public func append(element: Element) {
        // создаем асинхронный метод с barrier (он предотвратит перезапись элементов)
        queue.async(flags: .barrier) {
            self.array.append(element)
            print("\n\(element)")
            print(self.array, "\n")
        }
    }

    public var elements: [Element] {
        var result = [Element]() // создаем пустой массив
        // делаем синхронный запрос (так как нужен резутьтат)
        queue.sync {
            result = self.array
        }
        return result
    }
}


var safeArray = SafeArray<Int>()

//print("safeArray: \(safeArray.elements)")

DispatchQueue.concurrentPerform(iterations: 20) { (index) in
    safeArray.append(element: index)
}
print("safeArray: \(safeArray.elements)")
