//
//  LoginWorkerTests.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 20.03.2023.
//

import XCTest
@testable import TodoList

final class LoginWorkerTests: XCTestCase {

	func test_login_withValidData_shouldBeSuccess() {

		// arrange
		let sut = makeSUT()

		// act
		let result = sut.login(login: "Admin", password: "pa$$32!")

		// assert
		XCTAssertTrue(
			result,
			"Ошибка авторизации с валидным логином и паролем"
		)
	}

	func test_login_withNotValidData_shouldBeFailure() {

		// arrange
		let sut = makeSUT()

		// act
		let result = sut.login(login: "2", password: "2")

		// assert
		XCTAssertFalse(
			result,
			"Ошибка, успешная авторизация с невалидными логином и паролем"
		)
	}

	private func makeSUT() -> LoginWorker {
		LoginWorker()
	}
}
