//
//  Task.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TodoList

final class TaskTests: XCTestCase {

    func test_initTask_withValidTitle_shouldBeSuccess() {
		
		// arrange
		let sut: Task!
		
		// act
		let validTitle = "Valid title"
		sut = Task(title: validTitle)
		
		// assert
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertFalse(sut.isComplete)
    }
	
	func test_initTask_withValidTitleAndCompleteStatus_shouldBeSuccess() {
		
		// arrange
		let sut: Task!
		
		// act
		let validTitle = "Valid title"
		sut = Task(title: validTitle, isComplete: true)
		
		// assert
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertTrue(sut.isComplete)
	}
}
