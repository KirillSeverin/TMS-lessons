//
//  NetworkManager.swift
//  MVVM3
//
//  Created by Martynov Evgeny on 19.04.21.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchIPhones(completion: ([String]) -> ())
}

class NetworkManager: NSObject, NetworkManagerProtocol {

    func fetchIPhones(completion: ([String]) -> ()) {
        completion(["1 iPhone",
                    "2 iPhone 3G",
                    "3 iPhone 3GS",
                    "4 iPhone 4",
                    "5 iPhone 4S",
                    "6 iPhone 5",
                    "7 iPhone 5c",
                    "8 iPhone 5s",
                    "9 iPhone 6",
                    "10 iPhone 6 Plus",
                    "11 iPhone 6s",
                    "12 iPhone 6s Plus",
                    "13 iPhone SE (1st generation)",
                    "14 iPhone 7",
                    "15 iPhone 7 Plus",
                    "16 iPhone 8",
                    "17 iPhone 8 Plus",
                    "18 iPhone X",
                    "19 iPhone XR",
                    "20 iPhone XS",
                    "21 iPhone XS Max",
                    "22 iPhone 11",
                    "23 iPhone 11 Pro",
                    "24 iPhone 11 Pro Max",
                    "25 iPhone SE (2nd generation)",
                    "26 iPhone 12 mini",
                    "27 iPhone 12",
                    "28 iPhone 12 Pro",
                    "29 iPhone 12 Pro Max"])
    }
}
