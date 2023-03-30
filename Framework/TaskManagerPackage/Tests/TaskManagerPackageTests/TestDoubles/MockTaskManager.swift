//
//  TaskManagerPackage.swift
//  
//
//  Created by Коломенский Александр on 23.03.2023.
//

@testable import TaskManagerPackage

class MockTaskManager: ITaskManager {
	static let uncompletedHighImportantTask = ImportantTask(
		title: "uncompletedHighImportantTask",
		taskPriority: .high
	)
	static let uncompletedMediumImportantTask = ImportantTask(
		title: "uncompletedMediumImportantTask",
		taskPriority: .medium
	)
	static let uncompletedLowImportantTask = ImportantTask(
		title: "uncompletedLowImportantTask",
		taskPriority: .low
	)
	static let completedHighImportantTask = ImportantTask(
		title: "completedHighImportantTask",
		taskPriority: .high
	)
	static let completedMediumImportantTask = ImportantTask(
		title: "completedMediumImportantTask",
		taskPriority: .medium
	)
	static let completedLowImportantTask = ImportantTask(
		title: "completedLowImportantTask",
		taskPriority: .low
	)
	static let uncompletedRegularTask = RegularTask(title: "uncompletedRegularTask")
	static let completedRegularTask = RegularTask(title: "completedRegularTask", isComplete: true)

	func allTasks() -> [TaskManagerPackage.Task] {
		[
			MockTaskManager.completedLowImportantTask,
			MockTaskManager.uncompletedHighImportantTask,
			MockTaskManager.uncompletedLowImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.uncompletedMediumImportantTask,
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.uncompletedRegularTask,
			MockTaskManager.completedMediumImportantTask
		]
	}

	func completedTasks() -> [TaskManagerPackage.Task] {
		[
			MockTaskManager.completedLowImportantTask,
			MockTaskManager.completedRegularTask,
			MockTaskManager.completedHighImportantTask,
			MockTaskManager.completedMediumImportantTask
		]
	}

	func uncompletedTasks() -> [TaskManagerPackage.Task] {
		[
			MockTaskManager.uncompletedHighImportantTask,
			MockTaskManager.uncompletedLowImportantTask,
			MockTaskManager.uncompletedMediumImportantTask,
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
