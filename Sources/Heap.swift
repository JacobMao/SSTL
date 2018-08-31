//
//  Heap.swift
//  SSTL
//
//  Created by Jacob Mao on 8/31/18.
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

public struct Heap<E: Comparable> {
    private var _storage: Array<E>
    private let _compareBlock: (E, E) -> Bool

    init<S>(contentsOf newElements: S, compareBlock: @escaping (E, E) -> Bool) where S: Sequence, E == S.Element {
        _storage = Array<E>(newElements)
        _compareBlock = compareBlock
    }
}


private extension Heap {
    static func parentIndexOf(childIndex: Array<E>.Index) -> Array<E>.Index {
        return (childIndex - 1) / 2
    }

    static func leftChildIndexOf(parentIndex: Array<E>.Index) -> Array<E>.Index {
        return parentIndex * 2 + 1
    }

    static func rightIndexOf(parentIndex: Array<E>.Index) -> Array<E>.Index {
        return parentIndex * 2 + 2
    }

    func sinkAt(_ index: Array<E>.Index) {
        _storage
    }
}



