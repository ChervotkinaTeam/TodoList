//
//  TodoScreenObject.swift
//  TodoListScreenObject.swift
//
//  Created by Коломенский Александр on 16.04.2023.
//

import XCTest

final class TodoListScreenObject: BaseScreenObject {

	// MARK: - Private properties

	private lazy var tableView = app.tables [AccessibilityIdentifier.TodoListViewController.tableView.rawValue]
	private lazy var tableViewCell = app.tableRows [AccessibilityIdentifier.TodoListViewController.tableViewCell.rawValue]
	private lazy var viewController = app.otherElements [
		AccessibilityIdentifier.TodoListViewController.todoListViewController.rawValue
	]

	// MARK: - ScreenObject Methods

	@discardableResult
	func isTodoScreen() -> Self {
		assert(viewController, [.exists])
		assert(tableView, [.exists])
		assert(tableViewCell, [.exists])

		return self
	}

	@discardableResult
	func tapFirstCell() -> Self {
		let tableRow = app.tableRows ["\(AccessibilityIdentifier.TodoListViewController.tableViewCell.rawValue)[\(0):\(0)]"]
		assert(tableRow, [.exists])
		tableViewCell.tap()

		return self
	}
}
