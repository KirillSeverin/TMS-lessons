//
//  ViewModel.swift
//  MVVM2
//
//  Created by Martynov Evgeny on 18.04.21.
//

import Foundation

protocol TableViewViewModelProtocol {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol?

    func selectRow(atIndexPath indexPath: IndexPath)
    func viewModelForSelectedRow() -> DetailViewModelProtocol?
}

class TableViewViewModel: TableViewViewModelProtocol {

    private var selectedIndexPath: IndexPath?

    private var profiles = [Profile(name: "Name1", secondName: "SecondName1", age: 11),
                            Profile(name: "Name2", secondName: "SecondName2", age: 22),
                            Profile(name: "Name3", secondName: "SecondName3", age: 33)]

    func numberOfRows() -> Int {
        return profiles.count
    }

    // создание новой TableViewCellViewModel
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol? {
        let profile = profiles[indexPath.row]
        // одна модель порождает вторую Veiw Model
        return TableViewCellViewModel(profile: profile)
    }

    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }

    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
}
