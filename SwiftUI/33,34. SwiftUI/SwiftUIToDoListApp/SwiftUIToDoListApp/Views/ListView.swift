//
//  ListView.swift
//  SwiftUIToDoListApp
//
//  Created by Martynov Evgeny on 3.05.21.
//

import SwiftUI

struct ListView: View {

    /*
     
     @EnvironmentObject - отличный способ неявно внедрить экземпляр класса, который соответствует ObservableObject, в часть иерархии представления. Предположим, в вашем приложении есть модуль, который содержит 3-4 экрана, и все они используют одну и ту же ViewModel. Если вы не хотите явно передавать одну и ту же ViewModel из одного представления в другое, тогда вам понадобится @EnvironmentObject.
     
     В нашем примере мы внедряем environmentObject (listViewModel) в ListRowView. SwiftUI неявно предоставит доступ для внедренных environmentObject-ов. Мы можем быстро получить и подписаться на внедренные environmentObject-ы, используя обертку свойства @EnvironmentObject.
     
     */

    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            
            ForEach(listViewModel.items) { item in

//                HStack {
//                    Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
//                        .foregroundColor(item.isCompleted ? .green : .red)
//                    Text(item.title)
//                    Spacer()
//                }
//                    .font(.title2)
//                    .padding(.vertical, 8)
//                    .onTapGesture {
//                    withAnimation(.linear) {
//                        listViewModel.updateItem(item: item)
//                    }
//                }
                
                ListRowView(item: item)
                    .onTapGesture {
                    withAnimation(.linear) {
                        listViewModel.updateItem(item: item)
                    }
                }
            }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
        }
            .listStyle(PlainListStyle())
            .navigationTitle("Todo List 📝")
            .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink(
                destination: AddView(),
                label: {
                    Text("Add")
                })
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // имитируем NavigationView
            ListView()
        }
            .environmentObject(ListViewModel())
    }
}
