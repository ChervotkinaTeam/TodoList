//
//  TodoListViewControllerTests.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 25.03.2023.
//

import XCTest
@testable import TodoList

final class TodoListViewControllerTests: XCTestCase {

	// swiftlint:disable implicitly_unwrapped_optional
	private var interactor: TodoListInteractorSpy!
	private var window: UIWindow!
	private var sut: TodoListViewController!
	// swiftlint:enable implicitly_unwrapped_optional

	// MARK: - Lifecycle

	override func setUp() {
		super.setUp()

		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		sut = storyboard.instantiateViewController(identifier: "TodoListViewController") as? TodoListViewController
		interactor = TodoListInteractorSpy()
		sut.interactor = interactor
		window = UIWindow()
		window.addSubview(sut.view)
		RunLoop.current.run(until: Date())
	}

	override func tearDown() {
		sut = nil
		interactor = nil
		window = nil

		super.tearDown()
	}

	// MARK: - Public Methods

	func test_viewDidLoad_shouldBeSuccess() {

		sut.viewWillAppear(true)

		XCTAssertTrue(interactor.isCalledFetchedData, "не вызван interactor.fetchData()")
	}

	func test_render_displayData_shouldBeSuccess() {
		let tableView = TodoListTableViewSpy()

		let viewModel = TodoListModel.ViewModel(tasksBySections: [TodoListModel.ViewModel.Section]())

		sut.tableView = tableView
		sut.render(viewData: viewModel)

		XCTAssertTrue(tableView.isCalledReloadData, "viewController.tableView.reloadData")
	}
}
