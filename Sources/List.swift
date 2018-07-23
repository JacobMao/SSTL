//
//  List.swift
//  SSTL
//
//  Created by Jacob Mao on 3/20/18.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Jacob Mao.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  The name and characters used in the demo of this software are property of their
//  respective owners.

import Foundation

private class ListNode<T> {
    var next: ListNode<T>?
    let value: T

    init(value: T) {
        self.value = value
    }
}

public struct ListIterator<T>: IteratorProtocol {
    private var _node: ListNode<T>?

    fileprivate init(node: ListNode<T>?) {
        _node = node
    }

    mutating public func next() -> T? {
        let ret = _node?.value
        _node = _node?.next

        return ret
    }
}

public class List<T>: Sequence {
    public var front: T? {
        return _head?.value
    }

    public var underestimatedCount: Int {
        return _count >= 0 ? _count : 0
    }

    private var _head: ListNode<T>?
    private var _count: Int = 0

    public func pushFront(_ value: T) {
        let node = ListNode(value: value)

        if let head = _head {
            node.next = head
            _head = node
        } else {
            _head = node
        }

        _count += 1
    }

    @discardableResult
    public func popFront() -> T? {
        guard let headNode = _head else {
            return nil
        }

        _head = headNode.next
        _count -= 1

        return headNode.value
    }

    public func makeIterator() -> ListIterator<T> {
        return ListIterator(node: _head)
    }
}
