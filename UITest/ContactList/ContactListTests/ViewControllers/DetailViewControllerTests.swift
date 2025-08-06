//
//  DetailViewControllerTests.swift
//  ContactListTests
//
//  Created by Martynov Evgeny on 7.04.21.
//

import XCTest
@testable import ContactList

class DetailViewControllerTests: XCTestCase {

    var detailVC: DetailViewController!

    override func setUp() {
        super.setUp()
        // инициализируем
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(
            withIdentifier: "DetailViewController"
        ) as? DetailViewController
        // viewDidLoad
        detailVC.loadViewIfNeeded()
    }

    override func tearDown() {
        detailVC = nil
        super.tearDown()
    }

    // есть ли в class и на storyboard nameLabel?
    func testHasNameLable() {
        XCTAssertNotNil(detailVC.nameLabel)
        XCTAssertTrue(detailVC.nameLabel.isDescendant(of: detailVC.view))
    }

    // есть ли в class и на storyboard phoneLabel?
    func testHasPhoneLable() {
        XCTAssertNotNil(detailVC.phoneLabel)
        XCTAssertTrue(detailVC.phoneLabel.isDescendant(of: detailVC.view))
    }

    // есть ли в class и на storyboard surnameLabel?
    func testHasSurnameLable() {
        XCTAssertNotNil(detailVC.surnameLabel)
        XCTAssertTrue(detailVC.surnameLabel.isDescendant(of: detailVC.view))
    }

    // есть ли в class и на storyboard imageView?
    func testHasImageView() {
        XCTAssertNotNil(detailVC.imageView)
        XCTAssertTrue(detailVC.imageView.isDescendant(of: detailVC.view))
    }

    // проверяем содержимое nameLabel
    func testSetValueToNameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.nameLabel.text, "name") }

    // проверяем содержимое surname
    func testSetValueToSurnameLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.surnameLabel.text, "surname")
    }

    // проверяем содержимое phone
    func testSetValueToPhoneLabel() {
        setupContactAndAppearanceTrancition()
        XCTAssertEqual(detailVC.phoneLabel.text, "phone")
    }

//    // Нельзя сраванить UIImage
//    func testSetValueToImageView() {
//        setupContactAndAppearanceTrancition()
//        XCTAssertEqual(detailVC.imageView.image, #imageLiteral(resourceName: "avatar")) // fail
//    }

    // проверяем содержимое imageData
    func testSetValueToImageView() {
        setupContactAndAppearanceTrancition()
        let imageData = #imageLiteral(resourceName: "avatar").pngData()
        XCTAssert(detailVC.person.imageData == imageData)
    }

    // обычная func
    func setupContactAndAppearanceTrancition() {
        let image = #imageLiteral(resourceName: "avatar")
        let imageData = image.pngData()
        let person = Person(name: "name",
                            surname: "surname",
                            phone: "phone",
                            imageData: imageData)
        // передаем в detailVC
        detailVC.person = person
        // beginAppearanceTransition - запускает методы viewWillAppear....
        detailVC.beginAppearanceTransition(true, animated: true)
        // endAppearanceTransition сообщает об оончании перехода
        detailVC.endAppearanceTransition()
    }
}
