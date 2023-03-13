//
//  TaskManager.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TodoList

final class TaskManagerTests: XCTestCase {

	private var taskListCompleted =
	[
		RegularTask(title: "Do Workout", isComplete: true)
	]
	private var taskListUncompleted =
	[
		ImportantTask(title: "Do homework", taskPriority: .high),
		ImportantTask(title: "Write new tasks", taskPriority: .low),
		RegularTask(title: "Solve 3 algorithms"),
		ImportantTask(title: "Go shopping", taskPriority: .medium)
	]
	private var regularTask = RegularTask(title: "Read 10 pages")
	private var importantTask = ImportantTask(title: "Call mom", taskPriority: .medium)

	private func makeSut() -> TaskManager {
		TaskManager()
	}

	func test_addTasks_shouldBeSuccess() {

		// arrange
		let sut = makeSut()

		// act
		sut.addTasks(tasks: taskListCompleted + taskListUncompleted)

		// assert
		XCTAssertEqual(
			sut.allTasks().count,
			taskListCompleted.count + taskListUncompleted.count,
			"Ошибка при добавлении задач"
		)
	}

	func test_addTask_shouldBeSuccess() {

		// arrange
		let sut = makeSut()

		// act
		sut.addTask(task: regularTask)

		// assert
		XCTAssertEqual(
			sut.allTasks().count,
			1,
			"Ошибка при добавлении одной задачи"
		)
		XCTAssertEqual(
			sut.allTasks().first!,
			regularTask,
			"Неверное добавлении одной задачи"
		)
	}

	func test_removeTask_shouldBeSuccess() {

		// arrange
		let sut = makeSut()
		sut.addTask(task: regularTask)

		// act
		sut.removeTask(task: regularTask)

		// assert
		XCTAssertEqual(
			sut.allTasks().count,
			0,
			"Ошибка при удалении одной задачи"
		)
	}

	func test_removeTask_notСontained_shouldBeSuccess() {

		// arrange
		let sut = makeSut()
		sut.addTask(task: regularTask)

		// act
		sut.removeTask(task: importantTask)

		// assert
		XCTAssertEqual(
			sut.allTasks(),
			[regularTask],
			"Ошибка при удалении одной задачи"
		)
	}

	func test_allTasks_shouldBeSuccess() {

		// arrange
		let sut = makeSut()
		sut.addTasks(tasks: taskListCompleted + taskListUncompleted)

		// act
		let allTasks = sut.allTasks()

		// assert
		XCTAssertEqual(
			allTasks,
			taskListCompleted + taskListUncompleted,
			"Ошибка при добавлении списка задач"
		)
	}

	func test_completedTasks_shouldBeSuccess() {

		// arrange
		let sut = makeSut()
		sut.addTasks(tasks: taskListCompleted + taskListUncompleted)

		// act
		let completedTasks = sut.completedTasks()

		// assert
		XCTAssertEqual(
			completedTasks,
			taskListCompleted,
			"Неверное получения списка выполненных задачи"
		)
	}

	func test_uncompletedTasks_shouldBeSuccess() {

		// arrange
		let sut = makeSut()
		sut.addTasks(tasks: taskListCompleted + taskListUncompleted)

		// act
		let uncompletedTasks = sut.uncompletedTasks()

		// assert
		XCTAssertEqual(
			uncompletedTasks,
			taskListUncompleted,
			"Неверное получения списка невыполненных задачи"
		)
	}
}
