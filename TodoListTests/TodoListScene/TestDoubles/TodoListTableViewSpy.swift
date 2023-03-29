//
//  TodoListTableViewSpy.swift
//  TodoListTests
//
//  Created by Коломенский Александр on 26.03.2023.
//

import UIKit

final class TodoListTableViewSpy: UITableView {

	// MARK: - Public Properties

	private(set) var isCalledReloadData = false

	// MARK: - Public Methods

	override func reloadData() {
		super.reloadData()
		isCalledReloadData = true
	}
}
