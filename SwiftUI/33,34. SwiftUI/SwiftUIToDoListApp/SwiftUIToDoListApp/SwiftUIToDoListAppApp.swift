//
//  SwiftUIToDoListAppApp.swift
//  SwiftUIToDoListApp
//
//  Created by Martynov Evgeny on 3.05.21.
//

import SwiftUI

@main
struct SwiftUIToDoListAppApp: App {

    /*
     
     Обертки свойств (property wrappers)
     
     @StateObject - это новая обертка свойства, которая инициализирует экземпляр класса,  соответствующего протоколу ObservableObject, и сохраняет его во внутренней памяти фреймворка SwiftUI. SwiftUI создает только один @StateObject для каждого контейнера, который его объявляет, и хранит его вне жизненного цикла представления.
     
     @StateObject идеально подходит для хранения состояния приложения и передачи его различным сценам или представлениям внутри вашего приложения. SwiftUI сохранит его в специальной памяти фреймворка, чтобы ваши данные находились в безопасном месте вне сцены или жизненного цикла представления.
     
     */

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView { // ложим ListView в NavigationView
                ListView()
            }
                .environmentObject(listViewModel)
        }
    }
}
