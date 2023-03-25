//
//  TaskManagerPackage.swift
//  
//
//  Created by Коломенский Александр on 23.03.2023.
//

@testable import TaskManagerPackage

class MockTaskManager: ITaskManager {
	static let highImportantTask = ImportantTask(title: "highImportantTask", taskPriority: .high)
	static let mediumImportantTask = ImportantTask(title: "mediumImportantTask", taskPriority: .medium)
	static let lowImportantTask = ImportantTask(title: "lowImportantTask", taskPriority: .low)
	static let completedRegularTask = RegularTask(title: "completedRegularTask", isComplete: true)
	static let uncompletedRegularTask = RegularTask(title: "regularTask")

	func allTasks() -> [TaskManagerPackage.Task] {
		[
			MockTaskManager.highImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.uncompletedRegularTask
		]
	}

	func completedTasks() -> [TaskManagerPackage.Task] {
		[MockTaskManager.completedRegularTask]
	}

	func uncompletedTasks() -> [TaskManagerPackage.Task] {
		[
			MockTaskManager.highImportantTask,
			MockTaskManager.lowImportantTask,
			MockTaskManager.mediumImportantTask,
			MockTaskManager.uncompletedRegularTask
		]
	}

	func addTasks(tasks: [TaskManagerPackage.Task]) {
		fatalError("Not implimented!")
	}

	func addTask(task: TaskManagerPackage.Task) {
		fatalError("Not implimented!")
	}
}
