//
//  UnitTestingExampleAppTests.swift
//  UnitTestingExampleAppTests
//
//  Created by Martynov Evgeny on 31.03.21.
//

import XCTest
// import таргета который хотим тестировать
@testable import UnitTestingExampleApp

class UnitTestingExampleAppTests: XCTestCase {

    var sut: ViewController! // system under test (тестируемая система)

    // используется для создания обьектов необходимых для тестирования
    // (как viewDidLoad в контроллере)
    override func setUp() {
        super.setUp() // до создания обьектов
        sut = ViewController()
    }

    // после окончания тестирования объекты нужно выгрузить из памяти
    override func tearDown() {
        sut = nil
        super.tearDown() // обязательно после выгрузки объектов
    }

    // нижнее значение должно ровняться 0
    func testLowestVolumeShouldBeZero() {
        // given (что дано)
        sut.setVolume(with: -1)

        // when (что произошло)
        let volume = sut.volume

        // then (что должно получиться)
        // XCodeTest
        // XCTAssert - метод утвержданет что ...
        XCTAssert(volume == 0, "Lowest volume should be equal 0")
        // true - успех / false - сообщение
    }

    // максимальное значение должно ровняться 100
    func testHighestVolumeShouldBe100() {
        // given (что дано)
        sut.setVolume(with: 101)

        // when (что произошло)
        let volume = sut.volume

        // then (что должно получиться)
        XCTAssert(volume == 100, "Highest volume should be equal 100")
    }

    // Проверяем на true
    func testNumberOneMustBeGreaterThanNumberTwo() {

        //given
        let numberOne = 1
        let numberTwo = 0

        // when
        let result = sut.greaterThanValue(x: numberOne, y: numberTwo)

        // then
        XCTAssert(result, "The number one must be greater than number two")
    }

    // Проверяем на false
    func testNumberOneMustNotBeGreaterThanNumberTwo() {

        //given
        let numberOne = 1
        let numberTwo = 1

        // when
        let result = sut.greaterThanValue(x: numberOne, y: numberTwo)

        // then
        XCTAssert(!result, "The number one must be greater than number two")
    }

    // значение делится на 3?
    func testIsDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 3)
        // XCTAssertEqual - зачение 1-ого параметра равно 2-му
        XCTAssertEqual(result, true)
    }

    // значение делится на 3? Проверка на false
    func testIsNotDivisibleByThree() {
        let result = sut.isDivisibleByThree(number: 1)
        // Assert - утвержаем
        // Equal - равенство
        XCTAssertEqual(result, false)
    }

    //MARK: - ф-ции по умолчанию

    // Чтобы установить предусловия и обработать ошибки перед запуском каждого теста;
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    /*
     Пример как отключить permissions доступа к контактам в рамках теста:

     override func setUpWithError() throws {
             if #available(iOS 13.4, *) {
                 application.resetAuthorizationStatus(for: .contacts)
             } else {
                 throw XCTSkip("Required API is not available for this test.")
             }
         }

     В коде выше мы сбрасываем доступ к контактам в предусловии, если симулятор с версией iOS выше или равно 13.4. Если же нет, мы пропускам тест в прогоне.
     */

    // чтобы выполнить очистку после каждого теста в клаcсе и обработать ошибки
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // пример тестового метода
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Это пример функционального тестового случая.
        // Используйте XCTAssert и связанные с ним функции для проверки правильности результатов ваших тестов.
    }

    // пример тестового метода (на производительность)
    // отрабатывает 10 раз 1 блок кода и выводит его пр-ть
    // можно замерять улучшение производительности после оптимизации / рефакторинго кода
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        // Это пример теста производительности.
        self.measure {
            // Put the code you want to measure the time of here.
            // Поместите код, который вы хотите измерить время здесь.
        }
    }
}
