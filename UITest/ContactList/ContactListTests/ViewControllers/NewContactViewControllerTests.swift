//
//  NewContactViewControllerTests.swift
//  ContactListTests
//
//  Created by Martynov Evgeny on 7.04.21.
//

import XCTest
@testable import ContactList

class NewContactViewControllerTests: XCTestCase {

    var newContactVC: NewContactViewController!

    override func setUp() {
        super.setUp()
        // инициализация
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        newContactVC = storyboard.instantiateViewController(
            withIdentifier: "NewContactViewController"
        ) as? NewContactViewController
        // viewDidLoad
        newContactVC.loadViewIfNeeded()
    }

    override func tearDown() {
        newContactVC = nil
        super.tearDown()
    }

    // наличие nameTextField на storyboard
    func testHasNameTextField() {
        XCTAssertTrue(newContactVC.nameTextField.isDescendant(of: newContactVC.view))
    }

    // наличие phoneTextField на storyboard
    func testHasPhoneTextField() {
        XCTAssertTrue(newContactVC.phoneTextField.isDescendant(of: newContactVC.view))
    }

    // наличие surnameTextField на storyboard
    func testHasSurnameTextField() {
        XCTAssertTrue(newContactVC.surnameTextField.isDescendant(of: newContactVC.view))
    }

    // наличие saveButton на storyboard
    func testHasSaveButton() {
        XCTAssertTrue(newContactVC.saveButton.isDescendant(of: newContactVC.view))
    }

    // наличие cancelButton на storyboard
    func testHasCancelButton() {
        XCTAssertTrue(newContactVC.cancelButton.isDescendant(of: newContactVC.view))
    }

    // возможность добавить новый контакт
    func testSaveNewContact() {
        // заполняем
        newContactVC.nameTextField.text = "name"
        newContactVC.surnameTextField.text = "surname"
        newContactVC.phoneTextField.text = "phone"
        // инициализируем
        newContactVC.contactManager = ContactManager()
        // вызываем saveButtonPressed
        newContactVC.saveButtonPressed()
        // после сохранения извлекаем этот объект
        let contact = newContactVC.contactManager.person(at: 0)
        // сделаем такой же объект
        let imageData = #imageLiteral(resourceName: "avatar").pngData()
        let person = Person(
            name: "name",
            surname: "surname",
            phone: "phone",
            imageData: imageData
        )
        // сравним объекты
        XCTAssertEqual(contact, person)
    }

    //MARK: - UI TESTS

    // проверим существование кнопки SaveButton и то что она отрабатывает
    func testSaveButtonHasSaveMethod() {
        // saveButton: UIButton?
        let saveButton = newContactVC.saveButton
        // actions: [String]
        guard let actions = saveButton?.actions(
            forTarget: newContactVC,
            forControlEvent: .touchUpInside
        ) else { XCTFail(); return } // XCTFail если нет actions
        // проверяем наличие saveButtonPressed
        XCTAssertTrue(actions.contains("saveButtonPressed"))
    }

    // проверим существование кнопки SaveButton и то что она отрабатывает
    func testCancelButtonHasCancelMethod() {
        // saveButton: UIButton?
        let cancelButton = newContactVC.cancelButton
        // actions: [String]
        guard let actions = cancelButton?.actions(
            forTarget: newContactVC,
            forControlEvent: .touchUpInside
        ) else { XCTFail(); return }

        XCTAssertTrue(actions.contains("cancelButtonPressed"))
    }
}

//MARK: - Extension

extension NewContactViewControllerTests {

    // проверка метода Dismiss (для этого создадим MockNewContactViewController)
    func testSaveDismissesNewContactViewController() {
        // инициализируем
        let mockNewContactVC = MockNewContactViewController()
        // заполняем
        mockNewContactVC.nameTextField = UITextField()
        mockNewContactVC.nameTextField.text = "name"
        mockNewContactVC.surnameTextField = UITextField()
        mockNewContactVC.surnameTextField.text = "surname"
        mockNewContactVC.phoneTextField = UITextField()
        mockNewContactVC.phoneTextField.text = "phone"
        // инициализируем ContactManager
        mockNewContactVC.contactManager = ContactManager()
        // сохраняем
        mockNewContactVC.saveButtonPressed()
        // проверяем переход
        XCTAssertTrue(mockNewContactVC.isDismissed)
    }

    // проверка метода Dismiss (для этого создадим MockNewContactViewController)
    func testCancelDismissesNewContactViewController() {
        // инициализируем
        let mockNewContactVC = MockNewContactViewController()
        // cancelButtonPressed
        mockNewContactVC.cancelButtonPressed()
        // проверяем переход
        XCTAssertTrue(mockNewContactVC.isDismissed)
    }

    class MockNewContactViewController: NewContactViewController {
        var isDismissed = false
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
        }
    }
}

