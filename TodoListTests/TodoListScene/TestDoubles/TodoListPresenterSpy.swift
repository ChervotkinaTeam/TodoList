//
//  TodoListPresenterSpy.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 24.03.2023.
//

@testable import TodoList

final class TodoListPresenterSpy: ITodoListPresenter {

	// MARK: - Internal properties

	private (set) var isCalledPresent = false

	// MARK: - Internal Methods

	func present(response: TodoList.TodoListModel.Response) {
		isCalledPresent = true
	}
}
