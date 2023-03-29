//
//  ITaskManager+.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

/// Протокол для TaskManager
public protocol ITaskManager {

	/// Возвращает все задания.
	func allTasks() -> [Task]

	/// Возвращает все завешенные задания.
	func completedTasks() -> [Task]

	/// Возвращает все НЕзавершенные задания.
	func uncompletedTasks() -> [Task]

	/// Добавляет список заданий.
	func addTasks(tasks: [Task])
}

extension TaskManager: ITaskManager { }

extension ImportantTask.TaskPriority: CustomStringConvertible {
	public var description: String {
		switch self {
		case .high:
			return "!!!"
		case .medium:
			return "!!"
		case .low:
			return "!"
		}
	}
}
