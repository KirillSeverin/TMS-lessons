//
//  ClassWorkUnitTestTests.swift
//  ClassWorkUnitTestTests
//
//  Created by Kirill Severin on 31.03.21.
//

import XCTest
@testable import ClassWorkUnitTest

class ClassWorkUnitTestTests: XCTestCase {
    
    var sut: MathService!
    
    override func setUp() {
        super.setUp()
        sut = MathService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testIsCorrectSum() {
        let result = sut.addNumbers(x: 0, y: 3)
        XCTAssert(result == 3, "The value is not equal to the sum")
    }
    
    func testForTheResultOfCorrectMultiplication() {
        let result = sut.multipleNumbers(x: 5, y: -3)
        XCTAssert(result == -15, "The value is not equal to the multiplication of variables")
    }
    
    func testCheckResultDevision() {
    
        let zero = 0
        let number = 9
        let result = sut.divideNumbers(x: zero, y: number)
//        XCTAssertNil(false, "You can't divide by zero")
        XCTAssertTrue(result == nil)
    }
    
    func testForTheResultOfCorrectDivision() {
        let result = sut.divideNumbers(x: 4, y: 2)
        XCTAssert(result == 2, "The value is not equal to the division of variables")
    }
    
    //MARK: - Сгенерированные методы
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
