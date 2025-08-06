//
//  ListRowView.swift
//  SwiftUIToDoListApp
//
//  Created by Martynov Evgeny on 3.05.21.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Spacer()
            Text(item.title)
            Spacer()
        }
            .font(.title2)
            .padding()
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var item1 = ItemModel(title: "Item One", isCompleted: false)
    static var item2 = ItemModel(title: "Item Two", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
