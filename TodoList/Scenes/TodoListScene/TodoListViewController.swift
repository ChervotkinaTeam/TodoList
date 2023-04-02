//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import UIKit
import SwiftUI

protocol ITodoListViewController: AnyObject {
	func render(viewData: TodoListModel.ViewModel)
}

final class TodoListViewController: UITableViewController {

	var viewModel: TodoListModel.ViewModel = TodoListModel.ViewModel(tasksBySections: [])
	var interactor: ITodoListInteractor?

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()

		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.dataSource = self
		tableView.accessibilityIdentifier = AccessibilityId.tableView.rawValue
		interactor?.fetchData()
	}

	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		viewModel.tasksBySections.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewModel.tasksBySections[section].title
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let section = viewModel.tasksBySections[section]
		return section.tasks.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tasks = viewModel.tasksBySections[indexPath.section].tasks
		let taskData = tasks[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		var contentConfiguration = cell.defaultContentConfiguration()

		switch taskData {
		case .importantTask(let task):
			let redText = [NSAttributedString.Key.foregroundColor: Theme.red]
			let taskText = NSMutableAttributedString(string: "\(task.priority) ", attributes: redText )
			taskText.append(NSAttributedString(string: task.name))

			contentConfiguration.attributedText = taskText
			contentConfiguration.secondaryText = task.deadLine
			contentConfiguration.secondaryTextProperties.color = task.isOverdue ? Theme.red : Theme.black
			cell.accessoryType = task.isDone ? .checkmark : .none
		case .regularTask(let task):
			contentConfiguration.text = task.name
			cell.accessoryType = task.isDone ? .checkmark : .none
		}

		cell.tintColor = Theme.red
		cell.backgroundColor = Theme.backgroundColor
		contentConfiguration.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
		contentConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 19)
		cell.contentConfiguration = contentConfiguration

		cell.accessibilityIdentifier = "\(AccessibilityId.tableViewCell.rawValue)[\(indexPath.section):\(indexPath.row)]"
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor?.didTaskSelected(atIndex: TodoListModel.Request.TaskSelected(indexPath: indexPath))
	}
}

// MARK: - Extensions
extension TodoListViewController: ITodoListViewController {
	func render(viewData: TodoListModel.ViewModel) {
		self.viewModel = viewData
		tableView.reloadData()
	}
}

// MARK: - Private extensions
private extension TodoListViewController {

	func setupUI() {
		view.backgroundColor = Theme.backgroundColor
	}
}

// MARK: - Preview
#if DEBUG
struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			TodoListViewController().preview()
		}
	}
}

// MARK: - AccessibilityId
extension TodoListViewController {
	enum AccessibilityId: String {
		case tableView
		case tableViewCell
	}
}
