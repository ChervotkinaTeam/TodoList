//
//  TaskManager.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

/// Предоставляет список заданий.
final class TaskManager {
	private var taskList = [Task]()

	/// Список всех заданий.
	/// - Returns: Массив заданий.
	func allTasks() -> [Task] {
		taskList
	}

	/// Список выполненных заданий.
	/// - Returns: Массив заданий.
	func completedTasks() -> [Task] {
		taskList.filter { $0.isComplete }
	}

	/// Список заданий для выполнения.
	/// - Returns: Массив заданий.
	func uncompletedTasks() -> [Task] {
		taskList.filter { !$0.isComplete }
	}

	/// Добавление нового задания.
	/// - Parameter task: Задание.
	func addTask(task: Task) {
		taskList.append(task)
	}

	/// Добавление перечня заданий.
	/// - Parameter tasks: Массив заданий.
	func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}

	/// Удаление задания из списка. При вызове метода будут удалены все варианты этого задания по идентичности Task.
	/// - Parameter task: Задание, которое необходимо удалить.
	func removeTask(task: Task) {
		taskList.removeAll { $0 === task }
	}
}
