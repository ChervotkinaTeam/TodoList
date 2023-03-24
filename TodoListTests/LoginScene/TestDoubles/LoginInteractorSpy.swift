//
//  LoginInteractorSpy.swift
//  TodoListTests
//
//  Created by Kirill Leonov on 21.03.2023.
//

@testable import TodoList

class LoginInteractorSpy: ILoginInteractor {
	// MARK: - Internal Properties

	private(set) var isCalledLogin = false

	// MARK: - Internal Methods

	func login(request: TodoList.LoginModels.Request) {
		isCalledLogin = true
	}
}
