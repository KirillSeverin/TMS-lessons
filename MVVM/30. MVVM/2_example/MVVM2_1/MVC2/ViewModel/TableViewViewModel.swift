//
//  ViewModel.swift
//  MVVM2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import Foundation

protocol TableViewViewModelProtocol {
    func numberOfRows() -> Int
    func createCellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol?
}

class TableViewViewModel: TableViewViewModelProtocol {

    private var profiles = [Profile(name: "name1", secondName: "secondName1", age: 11),
                            Profile(name: "name2", secondName: "secondName2", age: 22),
                            Profile(name: "name3", secondName: "secondName3", age: 33)]

    func numberOfRows() -> Int {
        return profiles.count
    }

    // создание новой TableViewCellViewModel
    func createCellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol? {
        let profile = profiles[indexPath.row]
        // одна модель порождает вторую Veiw Model
        return TableViewCellViewModel(profile: profile)
    }
}
