//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

protocol ITodoListViewController: AnyObject {
	func render(viewData: TodoListModel.ViewModel)
}

final class TodoListViewController: UITableViewController {

	var viewModel: TodoListModel.ViewModel = TodoListModel.ViewModel(tasksBySections: [])
	var interactor: ITodoListInteractor?

	override func viewDidLoad() {
		super.viewDidLoad()

		setupUI()

		self.tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseIdentifier)
		tableView.dataSource = self
		self.view.accessibilityIdentifier = AccessibilityIdentifier.TodoListViewController.todoListViewController.rawValue
		tableView.accessibilityIdentifier = AccessibilityIdentifier.TodoListViewController.tableView.rawValue
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

		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: TaskTableViewCell.reuseIdentifier,
			for: indexPath
		) as? TaskTableViewCell else { return UITableViewCell() }

		cell.configure(task: taskData)

		cell.accessibilityIdentifier =
		"\(AccessibilityIdentifier.TodoListViewController.tableViewCell.rawValue)[\(indexPath.section):\(indexPath.row)]"
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
#endif
