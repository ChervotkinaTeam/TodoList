//
//  LoginViewControllerSpy.swift
//  TodoListTests
//
//  Created by Kirill Leonov on 21.03.2023.
//

@testable import TodoList

class LoginViewControllerSpy: ILoginViewController {
	// MARK: - Internal Properties

	private(set) var isCalledRender = false
	private(set) var viewModel = false

	// MARK: - Internal Methods
	func render(viewModel: TodoList.LoginModels.ViewModel) {
		isCalledRender = true

		if case .success = viewModel {
			self.viewModel = true
		}
	}
}
