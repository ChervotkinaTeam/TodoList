//
//  LoginAssembler.swift
//  TodoList
//
//  Created by Kirill Leonov on 01.03.2023.
//

import UIKit

final class LoginAssembler {
	func assembly() -> UIViewController {

		let viewController = LoginViewController()
		let presenter = LoginPresenter(viewController: viewController)
		let worker = LoginWorker()
		let interactor = LoginInteractor(worker: worker, presenter: presenter)
		viewController.interactor = interactor

		return viewController
	}
}
