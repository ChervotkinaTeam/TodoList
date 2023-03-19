//
//  ImportantTask.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TaskManagerPackage

final class ImportantTaskTests: XCTestCase {

	func test_initImportantTask_withLowPriority_shouldBeSuccess() {

		// arrange
		let sut: ImportantTask!

		// act
		let validTitle = "Valid title"
		let createDate = Date()
		sut = ImportantTask(title: validTitle, taskPriority: .low, createDate: createDate)
		let deadLine = Calendar.current.date(byAdding: .day, value: 3, to: createDate)

		// assert
		XCTAssertEqual(
			sut.title,
			validTitle,
			"Неверное значения заголовка задачи"
		)
		XCTAssertEqual(
			sut.taskPriority,
			.low,
			"Неверное значения приоритета задачи"
		)
		XCTAssertEqual(
			sut.deadLine,
			deadLine,
			"Неверное значения даты окончания задачи"
		)
		XCTAssertFalse(
			sut.isComplete,
			"Неверное значения статуса выполнения задачи"
		)
	}

	func test_initImportantTask_withMediumPriority_shouldBeSuccess() {

		// arrange
		let sut: ImportantTask!

		// act
		let validTitle = "Valid title"
		let createDate = Date()
		sut = ImportantTask(title: validTitle, taskPriority: .medium, createDate: createDate)
		let deadLine = Calendar.current.date(byAdding: .day, value: 2, to: createDate)

		// assert
		XCTAssertEqual(
			sut.title,
			validTitle,
			"Неверное значения заголовка задачи"
		)
		XCTAssertEqual(
			sut.taskPriority,
			.medium,
			"Неверное значения приоритета задачи"
		)
		XCTAssertEqual(
			sut.deadLine,
			deadLine,
			"Неверное значения даты окончания задачи"
		)
		XCTAssertFalse(
			sut.isComplete,
			"Неверное значения статуса выполнения задачи"
		)
	}

	func test_initImportantTask_withHighPriority_shouldBeSuccess() {

		// arrange
		let sut: ImportantTask!

		// act
		let validTitle = "Valid title"
		let createDate = Date()
		sut = ImportantTask(title: validTitle, taskPriority: .high, createDate: createDate)
		let deadLine = Calendar.current.date(byAdding: .day, value: 1, to: createDate)

		// assert
		XCTAssertEqual(
			sut.title,
			validTitle,
			"Неверное значения заголовка задачи"
		)
		XCTAssertEqual(
			sut.taskPriority,
			.high,
			"Неверное значения приоритета задачи"
		)
		XCTAssertEqual(
			sut.deadLine,
			deadLine,
			"Неверное значения даты окончания задачи"
		)
		XCTAssertFalse(
			sut.isComplete,
			"Неверное значения статуса выполнения задачи"
		)
	}
}
