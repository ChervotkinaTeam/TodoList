//
//  LoginPresenterSpy.swift
//  TodoListTests
//
//  Created by Kirill Leonov on 21.03.2023.
//

@testable import TodoList

final class LoginPresenterSpy: ILoginPresenter {
	// MARK: - Internal Properties

	private(set) var isCalledPresent = false

	// MARK: - Internal Methods

	func present(response: TodoList.LoginModels.Response) {
		isCalledPresent = true
	}
}
