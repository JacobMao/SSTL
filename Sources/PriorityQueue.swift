//
//  PriorityQueue.swift
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

struct Heap<E: Comparable> {
    fileprivate var _storage: Array<E>
    private let _compareBlock: (E, E) -> Bool
    private var isMadeHeap = false
    fileprivate var endIndexOffset: Array<E>.Index = 0

    init<C>(contentsOf newElements: C, compareBlock: @escaping (E, E) -> Bool) where C: Collection, E == C.Element {
        _storage = Array<E>(newElements)
        _compareBlock = compareBlock
    }
}

extension Heap {
    static func makeMaxHeap<C>(contentsOf newElements: C) -> Heap<C.Element> where C: Collection, E == C.Element {
        return Heap(contentsOf: newElements, compareBlock: <)
    }
    
    static func makeMinHeap<C>(contentsOf newElements: C) -> Heap<C.Element> where C: Collection, E == C.Element {
        return Heap(contentsOf: newElements, compareBlock: >=)
    }
}

fileprivate extension Heap {
    mutating func makeHeap() {
        guard !isMadeHeap else {
            return
        }
        
        let rangeOfNode = _storage.startIndex..._storage.index(_storage.startIndex, offsetBy: (_storage.count - 1) / 2)
        for i in rangeOfNode.reversed() {
            sinkFrom(i)
        }
        
        isMadeHeap = true
    }
    
    mutating func sinkFrom(_ index: Array<E>.Index) {
        assert((_storage.startIndex..<_storage.endIndex).contains(index), "index is out of range")
        
        let origElement = _storage[index]
        
        var fromIndex = index
        var rightIndex = Heap.rightIndexOf(parentIndex: fromIndex)
        while rightIndex < endIndex {
            var indexOfMaxElement = fromIndex
            
            if _compareBlock(_storage[indexOfMaxElement], _storage[rightIndex]) {
                indexOfMaxElement = rightIndex
            }
            
            let leftIndex = Heap.leftChildIndexOf(parentIndex: fromIndex)
            if _compareBlock(_storage[indexOfMaxElement], _storage[leftIndex]) {
                indexOfMaxElement = leftIndex
            }
            
            if indexOfMaxElement == fromIndex {
                break
            }
            
            _storage.swapAt(fromIndex, indexOfMaxElement)
            fromIndex = indexOfMaxElement
            rightIndex = Heap.rightIndexOf(parentIndex: fromIndex)
        }
        
        let leftIndex = Heap.leftChildIndexOf(parentIndex: fromIndex)
        if rightIndex == endIndex && _compareBlock(_storage[fromIndex], _storage[leftIndex]) {
            _storage[fromIndex] = _storage[leftIndex]
            fromIndex = leftIndex
        }
        
        _storage[fromIndex] = origElement
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
    
    var endIndex: Array<E>.Index {
        return _storage.index(_storage.endIndex, offsetBy: -(endIndexOffset))
    }
}

public func heapSorted<C>(_ elements: C) -> Array<C.Element> where C: Collection, C.Element: Comparable {
    if elements.count < 2 {
        return Array(elements)
    }
    
    var heap = Heap.makeMaxHeap(contentsOf: elements)
    
    heap.makeHeap()
    
    let range = heap._storage.index(after: heap._storage.startIndex)..<heap._storage.endIndex
    for i in range.reversed() {
        heap._storage.swapAt(i, heap._storage.startIndex)
        heap.endIndexOffset += 1
        heap.sinkFrom(heap._storage.startIndex)
    }
    
    return heap._storage
}

