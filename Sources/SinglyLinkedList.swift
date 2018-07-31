//
//  SinglyLinkedList.swift
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

private class SentinelNode<T> {
    var next: ListNode<T>?
    var value: T?
}

public struct SinglyLinkedListIterator<T>: IteratorProtocol {
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

public class SinglyLinkedList<T>: Sequence {
    public var front: T? {
        return _sentinel.next?.value
    }

    public var isEmpty: Bool {
        return _sentinel.next == nil
    }

    public var underestimatedCount: Int {
        return _count >= 0 ? _count : 0
    }

    // header sentinel
    private var _sentinel = SentinelNode<T>()
    private var _count: Int = 0


    public func pushFront(_ value: T) {
        let node = ListNode(value: value)

        node.next = _sentinel.next
        _sentinel.next = node

        _count += 1
    }

    @discardableResult
    public func popFront() -> T? {
        let removedNode = _sentinel.next
        _sentinel.next = _sentinel.next?.next

        _count -= 1

        return removedNode?.value
    }

    public func makeIterator() -> SinglyLinkedListIterator<T> {
        return SinglyLinkedListIterator(node: _sentinel.next)
    }
}
