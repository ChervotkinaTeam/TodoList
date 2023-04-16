//
//  SceneDelegate.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)

		// window.rootViewController = assemblyLoginViewController()
		window.rootViewController = assemblyTodoListViewController()
		window.makeKeyAndVisible()

		self.window = window
	}

	func assemblyLoginViewController() -> UIViewController {
		let loginViewController = LoginAssembler().assembly()
		let todoListViewController = TodoListAssembler().assembly()

		let router = LoginRouter(
			loginViewController: loginViewController,
			todoListViewController: todoListViewController
		)

		if let loginViewController = loginViewController as? LoginViewController {
			loginViewController.router = router
		}

		return loginViewController
	}

	func assemblyTodoListViewController() -> UIViewController {
		return TodoListAssembler().assembly()
	}
}
