import XCTest
@testable import Matrix

class MatrixTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Matrix().text, "Hello, World!")
    }


    static var allTests : [(String, (MatrixTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
