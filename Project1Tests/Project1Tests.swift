import XCTest
@testable import Project1

class GOLTests: XCTestCase {
    
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
    
    func testGol2() {
        let nextStates: [[Bool]] = nextCellStates([
            [false, true, false],
            [false, true, false],
            [false, true, false]
        ])
        let expected: [[Bool]] = [
            [false, false, false],
            [true, true, true],
            [false, false, false]
        ]
        XCTAssertEqual(expected, nextStates)
    }
    
    func testGol3() {
        let nextStates: [[Bool]] = nextCellStates([
            [false, false, false],
            [true, true, true],
            [false, false, false]
            ])
        let expected: [[Bool]] = [
            [false, true, false],
            [false, true, false],
            [false, true, false]
        ]
        XCTAssertEqual(expected, nextStates)
    }
    
    func testGol4() {
        let nextStates: [[Bool]] = nextCellStates([
            [true]
            ])
        let expected: [[Bool]] = [
            [false]
        ]
        
        XCTAssertEqual(expected, nextStates)
    }
    
    func testGol5() {
        let nextStates: [[Bool]] = nextCellStates([
            [true, true, true, true],
            [true, true, true, true],
            [true, true, true, true],
            [true, true, true, true]
            ])
        let expected: [[Bool]] = [
            [true, false, false, true],
            [false, false, false, false],
            [false, false, false, false],
            [true, false, false, true]
            
        ]
        XCTAssertEqual(expected, nextStates)
    }
}

class LRUCacheTests: XCTestCase {

    func testBasic() {
        let cache = LRUCache<Int, String>(capacity: 2)
        XCTAssertNil(cache.get(3))

        cache.set(3, v: "Hello")
        let s = cache.get(3)
        XCTAssertNotNil(s)
        XCTAssertEqual(s!, "Hello")
    }

    func testMiss() {
        let cache = LRUCache<Int, String>(capacity: 2)
        cache.set(3, v: "Hello")
        cache.set(2, v: "World!")
        cache.set(4, v: "Swift")
        XCTAssertNil(cache.get(3))
        XCTAssertEqual(cache.get(2)!, "World!")
    }
    
    func testNoCapacity() {
        let cache = LRUCache<Int, String>(capacity: 0)
        cache.set(3, v: "Hello")
        cache.set(2, v: "World!")
        XCTAssertNil(cache.get(3))
        XCTAssertNil(cache.get(2))
        
        
        let cache2 = LRUCache<Int, String>(capacity: -1)
        cache.set(3, v: "Hello")
        cache.set(2, v: "World!")
        XCTAssertNil(cache2.get(3))
        XCTAssertNil(cache2.get(2))
    }
    
    
    func testLarge() {
        //youtube LRU ex (https://www.youtube.com/watch?v=I9_BpSXBodU)
        let cache = LRUCache<Int, String>(capacity: 3)
        cache.set(2, v: "Hello")
        cache.set(3, v: "World!")
        cache.set(4, v: "Swift")
        cache.set(2, v: "Hello") //hit

        cache.set(1, v: "Hi!") //remove 3
        XCTAssertEqual(cache.get(4)!, "Swift")
        XCTAssertEqual(cache.get(2)!, "Hello")
        XCTAssertEqual(cache.get(1)!, "Hi!")
        
        cache.set(3, v: "World!") //remove 4
        XCTAssertEqual(cache.get(2)!, "Hello")
        XCTAssertEqual(cache.get(1)!, "Hi!")
        XCTAssertEqual(cache.get(3)!, "World!")
        
        cache.set(7, v: "...") //remove 2
        XCTAssertEqual(cache.get(1)!, "Hi!")
        XCTAssertEqual(cache.get(3)!, "World!")
        XCTAssertEqual(cache.get(7)!, "...")
        
        cache.set(5, v: "???") //remove 1
        XCTAssertEqual(cache.get(3)!, "World!")
        XCTAssertEqual(cache.get(7)!, "...")
        XCTAssertEqual(cache.get(5)!, "???")
        
        cache.set(4, v: "Swift") //remove 3
        XCTAssertEqual(cache.get(7)!, "...")
        XCTAssertEqual(cache.get(5)!, "???")
        XCTAssertEqual(cache.get(4)!, "Swift")
        
        cache.set(3, v: "World!") //remove 7
        XCTAssertEqual(cache.get(5)!, "???")
        XCTAssertEqual(cache.get(4)!, "Swift")
        XCTAssertEqual(cache.get(3)!, "World!")
        
        XCTAssertNil(cache.get(1))
        XCTAssertNil(cache.get(2))
        XCTAssertNil(cache.get(6))
        XCTAssertNil(cache.get(7))
        
        
    }
    
    func testNewVal() { //new value for same key - shouldnt change
        let cache = LRUCache<Int, String>(capacity: 2)
        cache.set(3, v: "Hello")
        cache.set(3, v: "World!")
        
        XCTAssertEqual(cache.get(3)!, "Hello")

    }
}
