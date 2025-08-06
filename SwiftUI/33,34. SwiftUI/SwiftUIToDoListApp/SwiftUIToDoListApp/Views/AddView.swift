//
//  AddView.swift
//  SwiftUIToDoListApp
//
//  Created by Martynov Evgeny on 3.05.21.
//

import SwiftUI

struct AddView: View {

    @EnvironmentObject var listViewModel: ListViewModel

    /*
     \.presentationMode - Привязка к текущему режиму представления, связанного с этой средой.
     */
    @Environment(\.presentationMode) var presentationMode

    /*
     @State — это обертка, которую мы можем использовать для обозначения состояния View. SwiftUI будет хранить ее в специальной внутренней памяти вне структуры AddView. Только связанный AddView может получить к ней доступ. Как только значение свойства @State изменяется, SwiftUI перестраивает AddView для учета изменений состояния.
     
     В нашем примере у нас есть простой экран с кнопкой и текстфиелдом. Как только мы водим текст - меняется textFieldText, как только   меняется showAlert появляется Alert.
     */

    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var isButtonEnabled: Bool = true

    var body: some View {

        ScrollView {
            VStack {

                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .onChange(of: textFieldText) {
                    textIsAppropriateTest()
                    print($0)
                }

                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                    .disabled(isButtonEnabled)

            }.padding(14)
        }
            .navigationTitle("Add an Item ✏️")
            .alert(isPresented: $showAlert, content: getAlert)
    }

    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)

            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsAppropriateTest() {
        isButtonEnabled = textFieldText.count < 3
    }

    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! 😋"
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
            .environmentObject(ListViewModel())
    }
}
