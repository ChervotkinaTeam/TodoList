//
//  AccessibilityIdentifier.swift
//  TodoList
//
//  Created by Коломенский Александр on 05.04.2023.
//

import Foundation

enum AccessibilityIdentifier {

	// MARK: - TodoListViewController
	enum TodoListViewController: String {
		case tableView
		case tableViewCell
	}

	// MARK: - LoginViewController
	enum LoginViewController: String {
		case buttonLogin
		case textFieldLogin
		case textFieldPass
	}
}
