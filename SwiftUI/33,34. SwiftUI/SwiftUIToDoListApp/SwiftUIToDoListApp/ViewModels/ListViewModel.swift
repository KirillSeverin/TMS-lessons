//
//  ListViewModel.swift
//  SwiftUIToDoListApp
//
//  Created by Martynov Evgeny on 3.05.21.
//

import Foundation

class ListViewModel: ObservableObject {

    /*
     
     SwiftUI отслеживает изменения в ObservableObject с помощью обертки @Published, и как только свойство, помеченное как @Published изменится, SwiftUI перестраивает все View, связанные с объектом ListViewModel.
     
     Наш класс ListViewModel, делят между собой экраны нашего приложения. На наших экранах мы должны обновить UI при изменениях items. SwiftUI отслеживает изменения в ObservableObject с помощью обертки @Published, и как только свойство, помеченное как @Published изменится, SwiftUI перестраивает все View, связанные с этим объектом ListViewModel. Мы используем обертку @EnvironmentObject для привязки наших Views к классу ListViewModel
     
     */

    @Published var items: [ItemModel] = [] // поставили бы @State если бы это св-во было во Veiw и использовалось только в нем

    init() {
        getItems()
    }
    
    deinit {
        
    }

    // данные не должны храниться во вью
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title", isCompleted: false),
            ItemModel(title: "This is the second title\nThis is the second title\nThis is the second title", isCompleted: true),
            ItemModel(title: "This is the third title", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
