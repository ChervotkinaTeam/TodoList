//
//  LoginWorkerSpy.swift
//  TodoListTests
//
//  Created by Kirill Leonov on 21.03.2023.
//

@testable import TodoList

class LoginWorkerSpy: ILoginWorker {
	// MARK: - Internal Properties

	private(set) var isCalledLogin = false

	// MARK: - Internal Methods

	func login(login: String, password: String) -> Bool {
		isCalledLogin = true
		return true
	}
}
