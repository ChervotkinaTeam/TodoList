//
//  RegularTask.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class RegularTaskTest: XCTestCase {

	func test_initRegularTask_withValidTitle_shouldBeSuccess() {

		// arrange
		let sut: RegularTask!

		// act
		let validTitle = "Valid title"
		sut = RegularTask(title: validTitle)

		// assert
		XCTAssertEqual(
			sut.title,
			validTitle,
			"Неверное значения заголовка задачи"
		)
		XCTAssertFalse(
			sut.isComplete,
			"Неверное значения статуса выполнения задачи"
		)
	}

	func test_initRegularTask_withValidTitleAndCompleteStatus_shouldBeSuccess() {

		// arrange
		let sut: RegularTask!

		// act
		let validTitle = "Valid title"
		sut = RegularTask(title: validTitle, isComplete: true)

		// assert
		XCTAssertEqual(
			sut.title,
			validTitle,
			"Неверное значения заголовка задачи"
		)
		XCTAssertTrue(
			sut.isComplete,
			"Неверное значения статуса выполнения задачи"
		)
	}
}
