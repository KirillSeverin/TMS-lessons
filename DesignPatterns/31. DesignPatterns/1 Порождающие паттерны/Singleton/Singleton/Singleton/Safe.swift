//
//  Safe.swift
//  Singleton
//
//  Created by Martynov Evgeny on 22.04.21.
//

class Safe {
    static let shared = Safe()
    private init() {}
    
    var someData = 0
}
