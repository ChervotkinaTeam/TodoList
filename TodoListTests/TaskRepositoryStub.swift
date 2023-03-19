//
//  TaskRepositoryStub.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 19.03.2023.
//

import XCTest
@testable import TodoList

final class TaskRepositoryStubTests: XCTestCase {
	private func makeSut() -> TaskRepositoryStub {
		return TaskRepositoryStub()
	}

	func test_getTasks_shouldBeGreaterThanOne() {

		// arrange
		let sut = makeSut()

		// act
		let tasks = sut.getTasks()

		// assert
		XCTAssertGreaterThan(
			tasks.count,
			0,
			"Список задач пуст"
		)
	}
}
