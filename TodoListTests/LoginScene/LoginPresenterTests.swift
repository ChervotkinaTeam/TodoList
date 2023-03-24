//
//  LoginPresenterTests.swift
//  TodoListTests
//
//  Created by Kirill Leonov on 20.03.2023.
//

import XCTest
@testable import TodoList

final class LoginPresenterTests: XCTestCase {

	private let viewController = LoginViewControllerSpy()

	func test_present_withValidRequest_shouldBeRenderSuccess() {
		let sut = makeSut()
		let response = LoginModels.Response(success: true)

		sut.present(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
		XCTAssertTrue(viewController.viewModel, "Ошибка в модели данных")
	}

	func test_present_withFailRequest_shouldBeRenderFailure() {
		let sut = makeSut()
		let response = LoginModels.Response(success: false)

		sut.present(response: response)

		XCTAssertTrue(viewController.isCalledRender, "Не вызван viewController.render(:)")
		XCTAssertFalse(viewController.viewModel, "Ошибка в модели данных")
	}
}

private extension LoginPresenterTests {
	func makeSut() -> LoginPresenter {
		LoginPresenter(viewController: viewController)
	}
}
