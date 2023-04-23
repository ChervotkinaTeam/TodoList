//
//  TodoListPresenterTests.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 25.03.2023.
//

import XCTest
@testable import TodoList

final class TodoListPresenterTests: XCTestCase {

	private let viewController = TodoListViewControllerSpy()

	func test_present_withValidRequest_shouldBeRenderSuccess() {
		let sut = makeSut()
		let response = makeResponse()

		sut.present(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
	}
}

// MARK: - Private 
private extension TodoListPresenterTests {
	func makeSut() -> TodoListPresenter {
		TodoListPresenter(viewController: viewController)
	}

	func makeResponse() -> TodoListModel.Response {
		return TodoListModel.Response(data: [TodoListModel.Response.SectionWithTasks]())
	}
}
