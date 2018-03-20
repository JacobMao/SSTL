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
