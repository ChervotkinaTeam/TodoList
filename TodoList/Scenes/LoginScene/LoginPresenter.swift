//
//  LoginPresenter.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

protocol ILoginPresenter {
	func present(response: LoginModels.Response)
}

class LoginPresenter: ILoginPresenter {
	private weak var viewController: ILoginViewController?

	init(viewController: ILoginViewController?) {
		self.viewController = viewController
	}

	func present(response: LoginModels.Response) {
		let viewModel: LoginModels.ViewModel = response.success ? .success : .failure("Неверный логин или пароль.")
		viewController?.render(viewModel: viewModel)
	}
}
