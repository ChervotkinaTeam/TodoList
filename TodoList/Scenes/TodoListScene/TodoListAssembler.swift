//
//  TodoListAssembler.swift
//  TodoList
//
//  Created by Kirill Leonov on 01.03.2023.
//

import UIKit
import TaskManagerPackage

final class TodoListAssembler {
	func assembly() -> UIViewController {

		let viewController = TodoListViewController()

		let taskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository: ITaskRepository = TaskRepositoryStub()
		taskManager.addTasks(tasks: repository.getTasks())
		let sectionForTaskManagerAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)

		let presenter = TodoListPresenter(viewController: viewController)
		let interactor = TodoListInteractor(sectionManager: sectionForTaskManagerAdapter, presenter: presenter)
		viewController.interactor = interactor

		return viewController
	}
}
