//
//  Stack.swift
//  SSTL
//
//  Created by Jacob Mao on 2/17/18.
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

public struct Stack<T> {
	fileprivate var _container = [T]()
}

public extension Stack {
	var isEmpty: Bool {
		return _container.isEmpty
	}
	
	var count: Int {
		return _container.count
	}
	
	var top: T? {
		return _container.last
	}
	
	mutating func push(_ value: T) {
		_container.append(value)
	}
	
	@discardableResult
	mutating func pop() -> T? {
		return _container.popLast()
	}
}

// TODO: Add conditional conformance for Equatable protocol in swift 5
public extension Stack where T: Equatable {
    static func ==(lhs: Stack, rhs: Stack) -> Bool {
        return lhs._container == rhs._container
    }

    static func !=(lhs: Stack, rhs: Stack) -> Bool {
        return !(lhs == rhs)
    }
}
