import XCTest
@testable import Project1

class Project1Tests: XCTestCase {
    
    var states: [[Bool]] = [
        [false, false, true],
        [true, true, true],
        [false, true, true]
    ]

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGOL() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let nextStates: [[Bool]] = nextCellStates(self.states)
        let expected: [[Bool]] = [
            [false, false, true],
            [true, false, false],
            [true, false, true]
        ]
        XCTAssertEqual(expected, nextStates)
    }

    
}
