//
//  TodoScreenUITest.swift
//  TodoListUITests
//
//  Created by Коломенский Александр on 12.04.2023.
//

import XCTest

class TodoScreenUITest: XCTestCase {

	// swiftlint:disable implicitly_unwrapped_optional
	private var app: XCUIApplication!
	private var todoScreenObject: TodoListScreenObject!
	// swiftlint:enable implicitly_unwrapped_optional

	// MARK: - Lifecycle

	override func setUp() {
		app = XCUIApplication()
		todoScreenObject = TodoListScreenObject(app: app)
		super.setUp()
	}

	// MARK: - Public Methods
	func test_setPriorityTask_mustBeSuccess() {

		app.launchArguments = ["TodoListViewController"]
		app.launch()

//		todoScreenObject
//			.isTodoScreen()
//			.tapFirstCell()
//
//		XCTAssert(
//			app.otherElements[AccessibilityIdentifier.TodoListViewController.todoListViewController.rawValue].exists,
//			"Ошибка, после ввода корректного логина и пароля не произошел переход на следующий экран"
//		)
	}
}
