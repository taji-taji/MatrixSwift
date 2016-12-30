import XCTest
@testable import Matrix

class MatrixTests: XCTestCase {
    
    func testPlus() {
        let m1 = try! Matrix(arrays: [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
        let m2 = try! Matrix(arrays: [[7.0, 8.0, 9.0], [10.0, 11.0, 12.0]])
        let result = try! m1 + m2
        
        XCTAssertEqual(result[0][0], 8.0)
        XCTAssertEqual(result[0][1], 10.0)
        XCTAssertEqual(result[0][2], 12.0)
        XCTAssertEqual(result[1][0], 14.0)
        XCTAssertEqual(result[1][1], 16.0)
        XCTAssertEqual(result[1][2], 18.0)
    }
    
    func testMinus() {
        let m1 = try! Matrix(arrays: [[7.0, 8.0, 9.0], [10.0, 11.0, 12.0]])
        let m2 = try! Matrix(arrays: [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
        let result = try! m1 - m2
        
        XCTAssertEqual(result[0][0], 6.0)
        XCTAssertEqual(result[0][1], 6.0)
        XCTAssertEqual(result[0][2], 6.0)
        XCTAssertEqual(result[1][0], 6.0)
        XCTAssertEqual(result[1][1], 6.0)
        XCTAssertEqual(result[1][2], 6.0)
    }
    
    func testScalarMultiple() {
        let m = try! Matrix(arrays: [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
        let result = try! 3 * m
        
        XCTAssertEqual(result[0][0], 3.0)
        XCTAssertEqual(result[0][1], 6.0)
        XCTAssertEqual(result[0][2], 9.0)
        XCTAssertEqual(result[1][0], 12.0)
        XCTAssertEqual(result[1][1], 15.0)
        XCTAssertEqual(result[1][2], 18.0)
    }
    
    func testInnerProduct() {
        let m1 = try! Matrix(arrays: [[7.0, 8.0, 9.0], [10.0, 11.0, 12.0]])
        let m2 = try! Matrix(arrays: [[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])
        
        let result = try! m1 +* m2
        
        XCTAssertEqual(result[0][0], 76.0)
        XCTAssertEqual(result[0][1], 100.0)
        XCTAssertEqual(result[1][0], 103.0)
        XCTAssertEqual(result[1][1], 136.0)
        XCTAssertEqual(result.shape.0, 2)
        XCTAssertEqual(result.shape.1, 2)
    }

    static var allTests : [(String, (MatrixTests) -> () throws -> Void)] {
        return [
            ("testPlus", testPlus),
            ("testMinus", testMinus),
            ("testScalarMultiple", testScalarMultiple),
            ("testInnerProduct", testInnerProduct)
        ]
    }
}
