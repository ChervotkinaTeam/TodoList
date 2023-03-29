//
//  OrderedTaskManagerTests.swift
//  
//
//  Created by Елена Червоткина on 29.03.2023.
//

import XCTest
@testable import TaskManagerPackage

class OrderedTaskManagerTests: XCTestCase {

	func test_allTasks_shouldBe5TaskOrderedByPriority() {
		// arrange
		let sut = makeSut()
		let validResultTasks: [TaskManagerPackage.Task] = [
			MockTaskManager.highImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask,
			MockTaskManager.completedRegularTask
		]

		// act
		let resultTasks = sut.allTasks()

		// assert
		XCTAssertEqual(resultTasks.count, 5, "При выборке всех задач, ожидалось, что их будет 5.")
		XCTAssertEqual(
			resultTasks,
			validResultTasks,
			"При выборке всех задач, порядок задач не совпал с сортировкой по приоритету."
		)
	}

	func test_completedTasks_shouldBeAllCompletedTaskOrderedByPriority() {
		// arrange
		let sut = makeSut()
		let validResultTasks: [TaskManagerPackage.Task] = [MockTaskManager.completedRegularTask]

		// act
		let resultTasks = sut.completedTasks()

		// assert
		XCTAssertEqual(resultTasks.count, 1, "При выборке завершенных задач, ожидалось, что их будет 1.")
		XCTAssertEqual(
			resultTasks,
			validResultTasks,
			"При выборке завершенных задач, порядок задач не совпал с сортировкой по приоритету."
		)
	}

	func test_uncompletedTasks_shouldBeAllUncompletedTaskOrderedByPriority() {
		// arrange
		let sut = makeSut()
		let validResultTasks: [TaskManagerPackage.Task] = [
			MockTaskManager.highImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.uncompletedRegularTask
		]

		// act
		let resultTasks = sut.uncompletedTasks()

		// assert
		XCTAssertEqual(resultTasks.count, 4, "При выборке незавершенных задач, ожидалось, что их будет 4.")
		XCTAssertEqual(
			resultTasks,
			validResultTasks,
			"При выборке незавершенных задач, порядок задач не совпал с сортировкой по приоритету."
		)
	}
}

// MARK: - Private

private extension OrderedTaskManagerTests {
	func makeSut() -> OrderedTaskManager {
		let mockTaskManager = MockTaskManager()
		return OrderedTaskManager(taskManager: mockTaskManager)
	}
}
