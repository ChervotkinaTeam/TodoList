//
//  LoginWorker.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

import Foundation

protocol ILoginWorker {
	func login(login: String, password: String) -> Bool
}

class LoginWorker: ILoginWorker {
	private let validLogin = "Admin"
	private let validPassword = "pa$$32!"

	func login(login: String, password: String) -> Bool {
		login == validLogin && password == validPassword
	}
}
