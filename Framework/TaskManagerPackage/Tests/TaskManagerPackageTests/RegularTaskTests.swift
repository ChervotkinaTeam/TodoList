//
//  RegularTask.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class RegularTaskTest: XCTestCase {

	func test_init_isComplete_shouldBeFalse() {

		// arrange
		let sut = makeSUT()

		// assert
		XCTAssertFalse(
			sut.isComplete,
			"Новая задача при создании должна иметь статус \"незавершенная\""
		)
	}

	func test_setPropertyIsCompleteToTrue_shouldBeTrue() {

		// arrange
		let sut = makeSUT()

		// act
		sut.isComplete = true

		// assert
		XCTAssertTrue(
			sut.isComplete,
			"Ошибка при изменении статуса задачи на \"завершенная\""
		)
	}

	private func makeSUT() -> RegularTask {
		RegularTask(title: "Valid title")
	}
}
