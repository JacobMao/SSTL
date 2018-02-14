//
//  StackTests.swift
//  Tests
//
//  Created by ST21073 on 2018/02/14.
//  Copyright © 2018 JacobMao. All rights reserved.
//

import XCTest

@testable import SSTL

class StackTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstruction() {
        var s = SSTL.Stack<Int>()
        let range = 1...5
        range.forEach { (value) in
            s.push(value)
        }

        XCTAssertTrue(s.count == range.count)
    }

    func testEmptyProperty() {
        var s = SSTL.Stack<Int>()
        XCTAssertTrue(s.isEmpty)
        s.push(1)
        XCTAssertFalse(s.isEmpty)
        s.pop()
        XCTAssertTrue(s.isEmpty)
    }

    func testCountProperty() {
        var s = SSTL.Stack<Int>()
        XCTAssertTrue(s.count == 0)
        s.push(1)
        XCTAssertTrue(s.count == 1)
    }

    func testTopProperty() {
        var s = SSTL.Stack<Int>()
        XCTAssertTrue(s.count == 0)
        s.push(1)
        s.push(2)
        s.push(3)
        XCTAssertTrue(s.top! == 3)
    }

    func testPopMethod() {
        var s = SSTL.Stack<Int>()
        XCTAssertTrue(s.count == 0)
        s.push(1)
        s.push(2)
        s.push(3)
        XCTAssertTrue(s.count == 3)
        XCTAssertTrue(s.top! == 3)
        s.pop()
        XCTAssertTrue(s.count == 2)
        XCTAssertTrue(s.top! == 2)
        s.pop()
        XCTAssertTrue(s.count == 1)
        XCTAssertTrue(s.top! == 1)
        s.pop()
        XCTAssertTrue(s.count == 0)
    }

    func testPushMethod() {
        var s = SSTL.Stack<Int>()
        s.push(1)
        XCTAssertTrue(s.count == 1)
        XCTAssertTrue(s.top! == 1)
        s.push(2)
        XCTAssertTrue(s.count == 2)
        XCTAssertTrue(s.top! == 2)
        s.push(3)
        XCTAssertTrue(s.count == 3)
        XCTAssertTrue(s.top! == 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
