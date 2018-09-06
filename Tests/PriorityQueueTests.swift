//
//  PriorityQueueTests.swift
//  Tests
//
//  Created by Jacob Mao on 9/1/18.
//  Copyright © 2018 JacobMao. All rights reserved.
//

import XCTest

@testable import SSTL

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

class PriorityQueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHeapSorting() {
        let testData = (0..<1_000_000).shuffled()
        let result1 = heapSorted(testData)
        let result2 = testData.sorted()

        assert(result1 == result2)
    }

    func testConstruction() {
        let qo = PriorityQueue(contentsOf: [0,1,2,3,4], isAscending: true)
        let q = qo

        assert(q.count == 5)
        assert((q.top ?? -1) == 0)
    }

    func testEmpty() {
        var q = PriorityQueue<Int>(isAscending: true)
        assert(q.isEmpty)
        q.push(1)
        assert(!q.isEmpty)
        q.pop()
        assert(q.isEmpty)
    }

    func testPush() {
        var q = PriorityQueue<Int>(isAscending: false)
        q.push(1)
        assert(q.top! == 1)
        q.push(3)
        assert(q.top! == 3)
        q.push(2)
        assert(q.top! == 3)
    }

    func testPop() {
        var q = PriorityQueue<Int>(isAscending: false)
        q.push(1)
        assert(q.top! == 1)
        q.push(3)
        assert(q.top! == 3)
        q.push(2)
        assert(q.top! == 3)

        q.pop()
        assert(q.top! == 2)
        q.pop()
        assert(q.top! == 1)

        q.pop()
        assert(q.isEmpty)
    }

    func testCount() {
        var q = PriorityQueue<Int>(isAscending: false)
        assert(q.count == 0)
        q.push(1)
        assert(q.count == 1)
        q.pop()
        assert(q.count == 0)
    }
}
