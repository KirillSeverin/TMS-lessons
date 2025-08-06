//
//  ContactListUITests.swift
//  ContactListUITests
//
//  Created by Martynov Evgeny on 31.03.21.
//

import XCTest

class ContactListUITests: XCTestCase {

    override func setUp() {
        // если зафейлится стопим
        continueAfterFailure = false
    }

    func testExample() {
        
        // экземпляр приложения + запуск
        let app = XCUIApplication()
        app.launch()
        
        // проверка на то что мы находимся на mainView
        XCTAssertTrue(app.isMainView)
        
        app.navigationBars["ContactList.ContactListView"].buttons["Add"].tap()
        
        app.textFields["Name"].tap()
        app.textFields["Name"].typeText("Name1")
        
        let surnameTextField = app.textFields["Surname"]
        surnameTextField.tap()
        surnameTextField.typeText("Surname1")
        
        // проверка что мы не на Main
        XCTAssertFalse(app.isMainView)
        
        app.buttons["Save"].tap()
        
        // проверка на наличие
        XCTAssertTrue(app.tables.staticTexts["Name1"].exists)
    }

    // скорость запуска приложения
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {
    var isMainView: Bool {
        return otherElements["mainView"].exists
    }
}
