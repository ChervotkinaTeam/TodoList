//
//  MockSectionForTaskManagerAdapter.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 24.03.2023.
//

import TaskManagerPackage
@testable import TodoList

final class MockSectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	static let uncompletedTask1 = ImportantTask(title: "uncompletedTask1", taskPriority: .high)
	static let uncompletedTask2 = ImportantTask(title: "uncompletedTask2", taskPriority: .medium)
	static let uncompletedTask3 = ImportantTask(title: "uncompletedTask3", taskPriority: .low)
	static let completedTask1 = RegularTask(title: "completedTask1", isComplete: true)
	static let completedTask2 = RegularTask(title: "completedTask2", isComplete: true)

	func getSections() -> [TodoList.Section] {
		[.completed, .uncompleted]
	}

	func getTasksForSection(section: TodoList.Section) -> [TaskManagerPackage.Task] {
		switch section {
		case .uncompleted:
			return [
				MockSectionForTaskManagerAdapter.uncompletedTask1,
				MockSectionForTaskManagerAdapter.uncompletedTask2,
				MockSectionForTaskManagerAdapter.uncompletedTask3
			]
		case .completed:
			return [
				MockSectionForTaskManagerAdapter.completedTask1,
				MockSectionForTaskManagerAdapter.completedTask2
			]
		default:
			return [Task]()
		}
	}

	func taskSectionAndIndex(task: TaskManagerPackage.Task) -> (section: TodoList.Section, index: Int)? {
		fatalError("Not implimented!")
	}

	func getSectionIndex(section: TodoList.Section) -> Int {
		switch section {
		case .uncompleted:
			return 0
		case .completed:
			return 1
		case .all:
			return 0
		}
	}

	func getSection(forIndex index: Int) -> TodoList.Section {
		switch index {
		case 0:
			return .completed
		case 1:
			return .uncompleted
		default:
			return .all
		}
	}

}
