//
//  TodoListViewControllerSpy.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 24.03.2023.
//

@testable import TodoList

final class TodoListViewControllerSpy: ITodoListViewController {
	// MARK: - Internal Properties

	private(set) var isCalledRender = false

	// MARK: - Internal Methods
	func render(viewData: TodoList.TodoListModel.ViewModel) {
		isCalledRender = true
	}
}
