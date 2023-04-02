//
//  LoginViewController.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import UIKit
import SwiftUI
import PinLayout

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

class LoginViewController: UIViewController {

	private lazy var buttonLogin: UIButton = makeButtonLogin(accessibilityId: .buttonLogin)
	private lazy var textFieldLogin: UITextField = makeTextField(accessibilityId: .textFieldLogin)
	private lazy var textFieldPass: UITextField = makeTextField(accessibilityId: .textFieldPass)

	var interactor: ILoginInteractor?
	var router: ILoginRouter?

	var loginText: String {
		get {
			textFieldLogin.text ?? ""
		}

		set {
			textFieldLogin.text = newValue
		}
	}

	var passText: String {
		get {
			textFieldPass.text ?? ""
		}

		set {
			textFieldPass.text = newValue
		}
	}

	@objc
	func login() {
		let request = LoginModels.Request(login: loginText, password: passText)
		interactor?.login(request: request)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}
}
// MARK: - Extensions
extension LoginViewController: ILoginViewController {
	func render(viewModel: LoginModels.ViewModel) {
		switch viewModel {
		case .success:
			router?.routeToTodoList()
		case .failure(let message):
			router?.showError(message: message)
		}
	}
}
// MARK: - Private extensions
private extension LoginViewController {

	func setupUI() {
		view.backgroundColor = Theme.backgroundColor
	}

	func layout() {
		[
			textFieldLogin,
			textFieldPass,
			buttonLogin
		].forEach { view.addSubview($0) }

		layoutConstraints()
	}

	func layoutConstraints() {
		textFieldLogin.pin
			.top(Sizes.PercentOfScreen.secondHalf)
			.horizontally(view.pin.readableMargins + Sizes.Padding.double)
			.minHeight(Sizes.L.height)

		textFieldPass.pin
			.below(of: textFieldLogin, aligned: .center)
			.size(of: textFieldLogin)
			.margin(Sizes.Padding.normal)

		buttonLogin.pin
			.below(of: textFieldPass, aligned: .center)
			.width(Sizes.L.width)
			.height(Sizes.L.height)
			.margin(Sizes.Padding.double)
	}

	func makeButtonLogin(accessibilityId: AccessibilityId) -> UIButton {
		let button = UIButton()

		button.configuration = .filled()
		button.configuration?.title = L10n.Authorization.toLogin
		button.configuration?.baseBackgroundColor = Theme.accentColor
		button.configuration?.cornerStyle = .medium
		button.addTarget(self, action: #selector(login), for: .touchUpInside)
		button.accessibilityIdentifier = accessibilityId.rawValue
		button.translatesAutoresizingMaskIntoConstraints = true

		return button
	}

	func makeTextField(accessibilityId: AccessibilityId) -> UITextField {
		let textField = UITextField()

		textField.backgroundColor = Theme.backgroundColor
		textField.textColor = Theme.black
		textField.layer.cornerRadius = Sizes.cornerRadius
		textField.layer.borderWidth = Sizes.borderWidth
		textField.layer.borderColor = Theme.black.cgColor
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: Sizes.Padding.half, height: textField.frame.height))
		textField.leftViewMode = .always
		textField.accessibilityIdentifier = accessibilityId.rawValue
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.font = UIFont.preferredFont(forTextStyle: .body)
		textField.adjustsFontForContentSizeCategory = true

		return textField
	}
}
// MARK: - Preview
#if DEBUG
struct LoginViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			LoginViewController().preview()
		}
	}
}

// MARK: - AccessibilityId
extension LoginViewController {
	enum AccessibilityId: String {
		case buttonLogin
		case textFieldLogin
		case textFieldPass
	}
}
