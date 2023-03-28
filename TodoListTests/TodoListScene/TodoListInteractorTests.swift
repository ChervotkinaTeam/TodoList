//
//  TodoListInteractorTests.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 24.03.2023.
//

import XCTest
@testable import TodoList

final class TodoListInteractorTests: XCTestCase {

	private let sectionManager = SectionForTaskManagerAdapter(taskManager: MockTaskManager())
	private let presenter = TodoListPresenterSpy()

	func test_fetchData_shouldCallPresenter() {
		let sut = makeSut()

		sut.fetchData()

		XCTAssertTrue(presenter.isCalledPresent, "Не вызван presenter.present(:)")
	}

	func test_didTaskSelected_withValidRequest_shouldCallPresenter() {
		let sut = makeSut()

		let indexPath =  IndexPath(row: 0, section: 0)
		let request = TodoListModel.Request.TaskSelected(indexPath: indexPath)
		sut.didTaskSelected(atIndex: request)

		XCTAssertTrue(presenter.isCalledPresent, "Не вызван presenter.present(:)")
	}

}

private extension TodoListInteractorTests {
	func makeSut() -> TodoListInteractor {
		TodoListInteractor(sectionManager: sectionManager, presenter: presenter)
	}
}
