//
//  ViewController.swift
//  UnitTestingExampleApp
//
//  Created by Martynov Evgeny on 31.03.21.
//

import UIKit

class ViewController: UIViewController {
    
    // Уровень громкости
    var volume = 0

    // Делаем метод который будет задавать громкость
    func setVolume(with value: Int) {
        // 0 <= уровень <= 100
//        volume = value
        volume = min(max(value, 0), 100)
    }

    // true если 1-ый > 2-ого
    func greaterThanValue(x: Int, y: Int) -> Bool {
        return x > y
    }

    // true если кратно 3 / isMultiple
    func isDivisibleByThree(number: Int) -> Bool {
        return number % 3 == 0
    }
}

