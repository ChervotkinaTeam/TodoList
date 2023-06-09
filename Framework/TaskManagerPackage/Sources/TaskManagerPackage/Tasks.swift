//
//  Tasks.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import Foundation

/// Задание, для ведения списка дел.
public class Task {

	/// Наименование задания.
	public var title: String

	/// Состояние задания -- выполнено ли задание.
	public var isComplete = false

	/// Инициализатор.
	/// - Parameters:
	///   - title: Наименование задания
	///   - isComplete: Состояние задания
	public init(title: String, isComplete: Bool = false) {
		self.title = title
		self.isComplete = isComplete
	}
}

extension Task: Equatable {
	public static func == (lhs: Task, rhs: Task) -> Bool {
		lhs.title == rhs.title && lhs.isComplete == rhs.isComplete
	}
}

/// Обычное задание.
public final class RegularTask: Task { }

/// Важное задание с приоритетом.
public final class ImportantTask: Task {

	/// Приоритет задания. Приоритет влияет на крайний срок выполнения задания.
	public enum TaskPriority: Int {
		/// Низкий приоритет. На выполнение задания с низким приоритетом, отводится 3 дня.
		case low
		/// Средний приоритет. На выполнение задания со средним приоритетом, отводится 2 дня.
		case medium
		/// Высокий приоритет. На выполнение задания с высоким приоритетом, отводится 1 день.
		case high
	}

	/// Крайний срок выполнения задания.
	public var deadLine: Date {
		switch taskPriority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: createDate) ?? createDate
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: createDate) ?? createDate
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: createDate) ?? createDate
		}
	}

	private let createDate: Date

	/// Приоритет задания.
	public var taskPriority: TaskPriority

	public init(title: String, taskPriority: TaskPriority, createDate: Date = Date(), isComplete: Bool = false) {
		self.taskPriority = taskPriority
		self.createDate = createDate
		super.init(title: title)
	}
}
