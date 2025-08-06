//
//  Box.swift
//  MVVM2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import Foundation

// Класс обертка(наблюдатель за объектом), без испольхования RX
// Оборачиваем интересующие нас свойства, и к этим св-вам добавляем наблюдателей -> при изменении какие-то действия
class Box<T> { // дженерик

    //MARK: - св-во за которым идет наблюдение

    var value: T {
        didSet { // действие при изменении value
            listener?(value) // передаем в listener -> value
        }
    }

    //MARK: - наблюдатель

    typealias Listener = (T) -> () // безымянная ф-я, принимает T, и выполняет какой-то блок со значением Т
    private var listener: Listener? // наблюдатель как св-во

    //MARK: - bind(связывать)

    func bind(listener: @escaping Listener) {
        self.listener = listener // связываем listener
        listener(value) // передаем в listener новое значение
    }

    //MARK: - init

    init(_ value: T) {
        self.value = value
    }
}
