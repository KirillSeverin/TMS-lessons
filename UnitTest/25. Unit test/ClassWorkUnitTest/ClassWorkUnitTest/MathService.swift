//
//  MathService.swift
//  ClassWorkUnitTest
//
//  Created by Kirill Severin on 31.03.21.
//

import Foundation

class MathService {
    
    func addNumbers(x: Int, y: Int) -> Int {
        return x + y
    }
    
    func multipleNumbers(x: Int, y: Int) -> Int {
        return x * y
    }
    
    func divideNumbers(x: Int, y: Int) -> Int? {
        return (y != 0) ? (x / y) : nil
    }
}
