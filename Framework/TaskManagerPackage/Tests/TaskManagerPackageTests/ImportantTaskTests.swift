//
//  ImportantTask.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class ImportantTaskTests: XCTestCase {

	func test_createImportantTask_withLowPriority_deadlineShouldBeIn3Days() {
		// arrange
		let create = Date()
		let sut = ImportantTask(title: "Test task", taskPriority: .low, createDate: create)

		// act
		let deadline = Calendar.current.date(byAdding: .day, value: 3, to: create)! // swiftlint:disable:this force_unwrapping

		// assert
		XCTAssertEqual(sut.deadLine, deadline, "Deadline для задачи с приоритетом Low выходит за рамки 3х дней.")
	}

	func test_createImportantTask_withMediumPriority_deadlineShouldBeIn2Days() {
		let create = Date()
		let sut = ImportantTask(title: "Test task", taskPriority: .medium, createDate: create)

		// act
		let deadline = Calendar.current.date(byAdding: .day, value: 2, to: create)! // swiftlint:disable:this force_unwrapping

		// assert
		XCTAssertEqual(sut.deadLine, deadline, "Deadline для задачи с приоритетом Medium выходит за рамки 2х дней.")
	}

	func test_createImportantTask_withHighPriority_deadlineShouldBeIn1Day() {
		// arrange
		let create = Date()
		let sut = ImportantTask(title: "Test task", taskPriority: .high, createDate: create)

		// act
		let deadline = Calendar.current.date(byAdding: .day, value: 1, to: create)! // swiftlint:disable:this force_unwrapping

		// assert
		XCTAssertEqual(sut.deadLine, deadline, "Deadline для задачи с приоритетом High выходит за рамки 1го дня.")
	}
}
