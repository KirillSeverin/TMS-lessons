//
//  ViewModel.swift
//  MVVM3
//
//  Created by Martynov Evgeny on 19.04.21.
//

import Foundation

protocol ViewModelProtocol {
    func fetchIPhones(completion: @escaping() -> ())
    func numberOfRowsInSection() -> Int
    func titleForCell(atIndexPath indexPath: IndexPath) -> String
}

class TableViewModel: NSObject, ViewModelProtocol {

    // injected from storyboard
    @IBOutlet weak var networkManager: NetworkManager!

    private var iPhones: [String]?

    func fetchIPhones(completion: @escaping() -> ()) {
        networkManager.fetchIPhones { [weak self] iPhones in
            self?.iPhones = iPhones
            completion()
        }
    }

    func numberOfRowsInSection() -> Int {
        return iPhones?.count ?? 0
    }

    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let iPhones = iPhones else { return "" }
        return iPhones[indexPath.row]
    }
}
