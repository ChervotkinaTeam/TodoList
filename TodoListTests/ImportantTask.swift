//
//  ImportantTask.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TodoList

final class ImportantTaskTests: XCTestCase {
	
	func test_initImportantTask_withLowPriority_shouldBeSuccess() {
		
		// arrange
		let sut: ImportantTask!
		
		// act
		let validTitle = "Valid title"
		let createDate = Date()
		sut = ImportantTask(title: validTitle, taskPriority: .low, createDate: createDate)
		
		// assert
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertEqual(sut.taskPriority, .low)
		let deadLine = Calendar.current.date(byAdding: .day, value: 3, to: createDate)
		XCTAssertEqual(sut.deadLine, deadLine)
		XCTAssertFalse(sut.isComplete)
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
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertEqual(sut.taskPriority, .medium)
		XCTAssertEqual(sut.deadLine, deadLine)
		XCTAssertFalse(sut.isComplete)
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
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertEqual(sut.taskPriority, .high)
		XCTAssertEqual(sut.deadLine, deadLine)
		XCTAssertFalse(sut.isComplete)
	}
}
