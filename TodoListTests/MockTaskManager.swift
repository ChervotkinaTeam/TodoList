//
//  MockTaskManager.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 21.03.2023.
//

@testable import TaskManagerPackage

class MockTaskManager: ITaskManager {

	static let hightImportantTask = ImportantTask(title: "Do homework", taskPriority: .high)
	static let mediumImportantTask = ImportantTask(title: "Go shopping", taskPriority: .medium)
	static let lowImportantTask = ImportantTask(title: "Write new tasks", taskPriority: .low)
	static let completedImportantTask = RegularTask(title: "By coffee algorithms", isComplete: true)
	static let completedRegularTask = RegularTask(title: "Solve 3 algorithms", isComplete: true)
	static let uncompletedRegularTask = RegularTask(title: "Uncompleted Regular", isComplete: false)

	func allTasks() -> [Task] {
		[
			MockTaskManager.hightImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.uncompletedRegularTask,
			MockTaskManager.completedImportantTask
		]
	}

	func completedTasks() -> [Task] {
		[
			MockTaskManager.completedRegularTask,
			MockTaskManager.completedImportantTask
		]
	}

	func uncompletedTasks() -> [Task] {
		[
			MockTaskManager.hightImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.uncompletedRegularTask
		]
	}

	func addTasks(tasks: [Task]) {
		fatalError("Not implemented!")
	}

	func addTask(task: Task) {
		fatalError("Not implemented!")
	}
}
