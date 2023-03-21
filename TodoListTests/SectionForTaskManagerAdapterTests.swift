//
//  SectionForTaskManagerAdapterTests.swift
//  TaskManagerPackageTests
//
//  Created by Коломенский Александр on 15.03.2023.
//

import XCTest
@testable import TodoList

final class SectionForTaskManagerAdapterTests: XCTestCase {

	private let mockTaskManager = MockTaskManager()

	func test_getSections_shouldBe2Sections() throws {
		// arrange
		let sut = makeSut()

		// act
		let currentSectionCount = sut.getSections().count

		// assert
		XCTAssertEqual(currentSectionCount, 2, "Количества секций должно быть 2 ")
	}

	func test_getSections_shouldBeEqualToUncompletedAndCompleted() throws {
		// arrange
		let sut = makeSut()

		// act
		let section = sut.getSections()

		// assert
		XCTAssertEqual(section, [.uncompleted, .completed], "Должны быть две секции .uncompleted и .completed")
	}

	func test_getSectionIndex_forSectionShoudBeReturnValidIndex() throws {
		// arrange
		let sut = makeSut()

		// act
		let uncompletedSectionIndex = sut.getSectionIndex(section: Section.uncompleted)
		let completedSectionIndex = sut.getSectionIndex(section: Section.completed)
		let allSectionIndex = sut.getSectionIndex(section: Section.all)

		// assert
		XCTAssertEqual(uncompletedSectionIndex, 0, "Индекс Section.uncompleted должен быть равен 0")
		XCTAssertEqual(completedSectionIndex, 1, "Индекс Section.completed должен быть равен 1")
		XCTAssertEqual(allSectionIndex, 0, "Индекс Section.all должен быть равен 0")

	}

	func test_getTasksForSection_ShouldBe2CompletedTaskForSectionCompleted() throws {
		// arrange
		let sut = makeSut()

		// act
		let completedTasks = sut.getTasksForSection(section: Section.completed)

		// assert
		XCTAssertEqual(
			completedTasks,
			mockTaskManager.completedTasks(),
			"Секция completed должна содержать 2 завершенные задачи")
	}

	func test_getTasksForSection_ShouldBe4UnCompletedTaskForSectionUnCompleted() throws {
		// arrange
		let sut = makeSut()

		// act
		let unCompletedTasks = sut.getTasksForSection(section: Section.uncompleted)

		// assert
		XCTAssertEqual(
			unCompletedTasks,
			mockTaskManager.uncompletedTasks(),
			"Секция completed должна содержать 4 незавершенные задачи")
	}

	func test_getTasksForSection_ShouldBe6TaskForSectionAll() throws {
		// arrange
		let sut = makeSut()

		// act
		let allTasks = sut.getTasksForSection(section: Section.all)

		// assert
		XCTAssertEqual(
			allTasks,
			mockTaskManager.allTasks(),
			"Секция all должна содержать 6 задач")
	}

}

private extension SectionForTaskManagerAdapterTests {
	func makeSut() -> SectionForTaskManagerAdapter {
		return SectionForTaskManagerAdapter(taskManager: mockTaskManager)
	}
}
