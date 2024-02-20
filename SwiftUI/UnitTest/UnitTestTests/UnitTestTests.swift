//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by Flapper on 2/20/24.
//

/*
 // 두 값이 같은지 or 다른지 확인합니다.
     XCTAssertEqual(expression1: T, expression2: T, message: String)
     XCTAssertNotEqual(expression1: T, expression2: T, message: String)
         // expression1 테스트 대상 실제 값
         // expression2: 예상 값
         // message: 실패 시 출력할 메시지

 // 두 실수 값이 지정한 정확도 범위 내에 있는지 확인합니다.
     XCTAssertEqual(expression1: T, expression2: T, accuracy: T, message: String)
     XCTAssertNotEqual(expression1: T, expression2: T, accuracy: T, message: String)
         // expression1 테스트 대상 실제 값
         // expression2: 예상 값
         // accuracy: 허용 오차 범위(expression1 과 expression2의 최대 차이)
         // message: 실패 시 출력할 메시지

 // 조건이 참인지 거짓인지 확인합니다.
     XCTAssertTrue(expression: Bool, message: String)
     XCTAssertFalse(expression: Bool, message: String)
         // expression: 테스트 대상 조건
         // message: 실패 시 출력할 메시지

 // 값이 nil인지 아닌지 확인합니다.
     XCTAssertNil(expression: Any?, message: String)
     XCTAssertNotNil(expression: Any?, message: String)
         // expression: 테스트 대상 값
         // message: 실패 시 출력할 메시지
 */

import XCTest

final class UnitTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
