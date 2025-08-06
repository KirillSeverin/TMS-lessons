//
//  DataStore.swift
//  SRP
//
//  Created by Martynov Evgeny on 24.03.21.
//

import Foundation

class DataStore {

    static let shared = DataStore()
    private init() { }

    public func saveName(name: String) {
        print("Your name: \(name) is saved")
    }

    public func getName() -> String {
        return "some name"
    }
}
