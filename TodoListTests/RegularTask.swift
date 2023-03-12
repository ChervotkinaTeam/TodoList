//
//  RegularTask.swift
//  TodoListTests
//
//  Created by Елена Червоткина on 12.03.2023.
//

import XCTest
@testable import TodoList

final class RegularTaskTest: XCTestCase {

	func test_initRegularTask_withValidTitle_shouldBeSuccess() {
		
		// arrange
		let sut: RegularTask!
		
		// act
		let validTitle = "Valid title"
		sut = RegularTask(title: validTitle)
		
		// assert
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertFalse(sut.isComplete)
	}
	
	func test_initRegularTask_withValidTitleAndCompleteStatus_shouldBeSuccess() {
		
		// arrange
		let sut: RegularTask!
		
		// act
		let validTitle = "Valid title"
		sut = RegularTask(title: validTitle, isComplete: true)
		
		// assert
		XCTAssertEqual(sut.title, validTitle)
		XCTAssertTrue(sut.isComplete)
	}
}
