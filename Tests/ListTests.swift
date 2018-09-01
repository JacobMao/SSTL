//
//  ListTests.swift
//  Tests
//
//  Created by Jacob Mao on 2018/03/22.
//  Copyright © 2018 JacobMao. All rights reserved.
//

import XCTest

@testable import SSTL

class ListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let l = SSTL.List<Int>()
        l.pushFront(1)
        l.pushFront(2)
        l.pushFront(3)

        print(l.contains(1))

        let i = 0
    }
    
}
