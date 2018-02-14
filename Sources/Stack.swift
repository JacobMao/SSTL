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

public extension Stack: Equatable where T: Equatable {

}
