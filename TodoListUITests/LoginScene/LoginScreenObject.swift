//
//  LoginSceneObject.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 05.04.2023.
//

import XCTest

final class LoginScreenObject: BaseScreenObject {
	lazy var textFieldLogin = app.textFields [AccessibilityIdentifier.LoginViewController.textFieldLogin.rawValue]
	lazy var textFieldPass = app.textFields [AccessibilityIdentifier.LoginViewController.textFieldPass.rawValue]
	lazy var buttonLogin = app.buttons [AccessibilityIdentifier.LoginViewController.buttonLogin.rawValue]

	@discardableResult
	func isLoginScreen() -> Self {
		assert(textFieldLogin, [.exists])
		assert(textFieldPass, [.exists])
		assert(buttonLogin, [.exists])

		return self
	}

	@discardableResult
	func set(login: String) -> Self {
		assert(textFieldLogin, [.exists])
		textFieldLogin.tap()
		textFieldLogin.typeText(login)

		return self
	}

	@discardableResult
	func set(password: String) -> Self {
		assert(textFieldPass, [.exists])
		textFieldPass.tap()
		textFieldPass.typeText(password)

		return self
	}

	@discardableResult
	func login() -> Self {
		assert(buttonLogin, [.exists])
		buttonLogin.tap()

		return self
	}
}
