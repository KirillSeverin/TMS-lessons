import UIKit

//MARK: - simple func (without handling)

func divide(param1: Int, param2: Int) -> Int {
    return param1 / param2
}

divide(param1: 10, param2: 5)

//MARK: - do-catch (func with handling)

enum divError: Error {
    case DivByZero
    case DivByMinus
}

func divideNew(param1: Int, param2: Int) throws -> Int {
    if param2 == 0 {
        throw divError.DivByZero
    } else if param2 < 0 {
        throw divError.DivByMinus
    } else {
        return param1 / param2
    }
}

let i = try? divideNew(param1: 10, param2: 2)

do {
    try divideNew(param1: 10, param2: 5)
} catch divError.DivByZero {
    print("Делим на ноль")
} catch divError.DivByMinus {
    print("Делим на отрицательное число")
}
