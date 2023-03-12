//
//  Task.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TodoList

final class TaskTests: XCTestCase {

    func test_init_withValidData_shouldBeSuccess() {
		let validTitle = "Valid title"
		let sut = Task(title: validTitle)
		
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertFalse(sut.isComplete)
    }
	
	func test_init_withCompleteStatus_shouldBeSuccess() {
		let validTitle = "Valid title"
		let sut = Task(title: validTitle, isComplete: true)
		
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertTrue(sut.isComplete)
	}
}
