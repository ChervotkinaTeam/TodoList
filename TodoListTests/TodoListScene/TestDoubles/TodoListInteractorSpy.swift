//
//  TodoListInteractorSpy.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 24.03.2023.
//

@testable import TodoList

final class TodoListInteractorSpy: ITodoListInteractor {

	// MARK: - Internal properties

	private (set) var isCalledPresent = false
	private (set) var isCalledFetchedData = false

	// MARK: - Internal Methods

	func fetchData() {
		isCalledFetchedData = true
	}

	func didTaskSelected(atIndex: TodoList.TodoListModel.Request.TaskSelected) {
		isCalledPresent = true
	}

}
