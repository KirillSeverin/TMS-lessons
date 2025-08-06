//
//  BitMaskCategory.swift
//  ARKitDemo2
//
//  Created by Martynov Evgeny on 19.05.21.
//

import Foundation

// Битовая маска - позволяет не взаимодействовать всем объектам со всеми, а задать правила
// Битовая маска говорит объекту на какие объекты он может взаимодествовать

struct BitMaskCategory {
    // не сталкиваемся вообще
    static let none = 0 << 0
    // сталкиваемся с объекми у которых BitMask = 1
    static let box = 1 << 0
    // сталкиваемся с объекми у которых BitMask = 2
    static let plane = 1 << 1
    // если BitMask = 3, то сталкивается и с box и plane
}
