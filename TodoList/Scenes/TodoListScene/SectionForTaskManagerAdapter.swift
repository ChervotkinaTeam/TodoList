//
//  SectionForTaskManagerAdapter.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import TaskManagerPackage

protocol ISectionForTaskManagerAdapter {
	func getSections() -> [Section]
	func getTasksForSection(section: Section) -> [Task]
	func taskSectionAndIndex(task: Task) -> (section: Section, index: Int)?
	func getSectionIndex(section: Section) -> Int
	func getSection(forIndex index: Int) -> Section
}

enum Section: CaseIterable {
	case completed
	case uncompleted
	case all

	var title: String {
		switch self {
		case .completed:
			return L10n.Task.State.completed
		case .uncompleted:
			return L10n.Task.State.uncompleted
		case .all:
			return L10n.Task.State.all
		}
	}
}

final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {

	private let sections: [Section] = [.uncompleted, .completed]

	private let taskManager: ITaskManager

	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}

	func getSections() -> [Section] {
		sections
	}

	func getSectionIndex(section: Section) -> Int {
		sections.firstIndex(of: section) ?? 0
	}

	func getSection(forIndex index: Int) -> Section {
		let minIndex = min(index, sections.count - 1)
		return sections[minIndex]
	}

	func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManager.completedTasks()
		case .uncompleted:
			return taskManager.uncompletedTasks()
		case .all:
			return taskManager.allTasks()
		}
	}

	func taskSectionAndIndex(task: Task) -> (section: Section, index: Int)? {
		for section in sections {
			let index = getTasksForSection(section: section).firstIndex { task === $0 }
			if let index = index {
				return (section, index)
			}
		}
		return nil
	}
}
