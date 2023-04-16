//
//  BaseSceneObject.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 05.04.2023.
//

import XCTest

class BaseScreenObject {
	// MARK: - Private properties
	private static let defaultTimeout: TimeInterval = 5

	// MARK: - Dependencies
	let app: XCUIApplication

	init(app: XCUIApplication) {
		self.app = app
	}

	@discardableResult
	func assert(
		_ element: XCUIElement,
		_ predicates: [Predicate],
		timeout: TimeInterval = defaultTimeout
	) -> Self {
		let expectation = XCTNSPredicateExpectation(
			predicate: NSPredicate(format: predicates.map { $0.format }.joined(separator: " AND ")),
			object: element
		)

		guard XCTWaiter.wait(for: [expectation], timeout: timeout) == .completed else {
			XCTFail("[\(self) Элемент \(element.description) не соответствует ожиданию: \(predicates.map { $0.format })")
			return self
		}
		return self
	}
}
