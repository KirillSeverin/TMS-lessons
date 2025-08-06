//
//  ItemModel.swift
//  SwiftUIToDoListApp
//
//  Created by Martynov Evgeny on 3.05.21.
//

import Foundation

/*
 Identifiable - позволяет нам не указывать ключ связи — автоматически используется id
 */

struct ItemModel: Identifiable {

    let id: UUID
    let title: String
    let isCompleted: Bool

    init(id: UUID = UUID(), title: String, isCompleted: Bool) {
        self.id = UUID() // Универсально уникальное значение, которое можно использовать для идентификации типов, интерфейсов и других элементов (“E621E1F8-C36C-495A-93FC-0C247A3E6E5F”)
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
