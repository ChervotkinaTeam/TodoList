//
//  LoginSceneUITest.swift
//  TodoListUITests
//
//  Created by Коломенский Александр on 06.04.2023.
//

import XCTest

final class TodoListUITests: XCTestCase {

	// swiftlint:disable implicitly_unwrapped_optional
	private var app: XCUIApplication!
	private var loginScreenObject: LoginScreenObject!
	// swiftlint:enable implicitly_unwrapped_optional

	// MARK: - Lifecycle

	override func setUp() {
		app = XCUIApplication()
		loginScreenObject = LoginScreenObject(app: app)
		super.setUp()
	}

	// MARK: - Public Methods

	func test_login_withValidCredentials_mustBeSuccess() {

		app.launch()

		loginScreenObject
			.isLoginScreen()
			.set(login: "Admin")
			.set(password: "pa$$32!")
			.login()

		XCTAssert(
			app.tables[AccessibilityIdentifier.TodoListViewController.tableView.rawValue].exists,
			"После ввода корректного логина и пароля не произошел переход на следующий экран"
		)
	}

	func test_login_withInvalidCredentials_mustBeFailure() {

		app.launch()

		loginScreenObject
			.isLoginScreen()
			.set(login: "dmin")
			.set(password: "a$$")
			.login()
			.isLoginScreen()

		XCTAssertFalse(
			app.tables[AccessibilityIdentifier.TodoListViewController.tableView.rawValue].exists,
			"После ввода некорректного логина и пароля произошел переход на другой экран"
		)
	}
}
