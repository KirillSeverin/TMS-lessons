//
//  ContentView.swift
//  testSwiftUI
//
//  Created by Martynov Evgeny on 3.05.21.
//

import SwiftUI

struct ContentView: View {

    /*
     
     Обертки свойств (property wrappers)
     
     Зачем нужны обертки свойств в SwiftUI?

     SwiftUI использует неизменяемые (immutable) типы структур для описания иерархии представлений. Все представления, которые предоставляет SwiftUI, неизменяемые. Вот почему SwiftUI дает нам набор оберток свойств - для обработки изменений данных. Обертки свойств позволяют нам объявлять себя внутри представлений SwiftUI, но хранить данные вне представления, объявляющего обертку.
     
     @State — это обертка, которую мы можем использовать для обозначения состояния View. SwiftUI будет хранить ее в специальной внутренней памяти вне структуры View. Только связанный View может получить к ней доступ. Как только значение свойства @State изменяется, SwiftUI перестраивает View для учета изменений состояния.
     */

    @State var valueState: String = ""
    @State var valueState2: String = ""
    @State var valueState3: String = ""

    var body: some View {
        ScrollView {
            VStack {
                Text("valueState = \(valueState)\nvalueState2 = \(valueState2)\nvalueState3 = \(valueState3)\n")
                    .padding()
                Divider()
                TextField("Type something here...", text: $valueState)
                Divider()
                TextField("Type something here...", text: $valueState2)
                Divider()
                TextField("Type something here...", text: $valueState3)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
