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

		self.tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseIdentifier)
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

		// swiftlint:disable force_cast
		let cell = tableView.dequeueReusableCell(
			withIdentifier: TaskTableViewCell.reuseIdentifier,
			for: indexPath
		) as! TaskTableViewCell
		// swiftlint:enable force_cast

		cell.configure(task: taskData)

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
#endif

// MARK: - AccessibilityId
extension TodoListViewController {
	enum AccessibilityId: String {
		case tableView
		case tableViewCell
	}
}
