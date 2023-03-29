//
//  TaskRepositoryStub.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 19.03.2023.
//

import XCTest
@testable import TodoList

final class TaskRepositoryStubTests: XCTestCase {

	func test_getTasks_shouldBeNotEmpty() {

		// arrange
		let sut = makeSUT()

		// act
		let tasks = sut.getTasks()

		// assert
		XCTAssertGreaterThan(
			tasks.count,
			0,
			"Список задач пуст"
		)
	}

	private func makeSUT() -> TaskRepositoryStub {
		TaskRepositoryStub()
	}
}
