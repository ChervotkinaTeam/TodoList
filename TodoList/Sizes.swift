//
//  Sizes.swift
//  TodoList
//
//  Created by Коломенский Александр on 31.03.2023.
//

import Foundation

enum Sizes {

	static let cornerRadius: CGFloat = 6
	static let borderWidth: CGFloat = 1

	enum Padding {
		static let half: CGFloat = 8.0
		static let normal: CGFloat = 16.0
		static let double: CGFloat = 32.0
	}

	enum L { // swiftlint:disable:this type_name
		static let width: CGFloat = 200
		static let height: CGFloat = 50
	}

	enum M { // swiftlint:disable:this type_name
		static let width: CGFloat = 100
		static let height: CGFloat = 40
	}

	enum S { // swiftlint:disable:this type_name
		static let width: CGFloat = 80
		static let height: CGFloat = 30
	}

	enum PercentOfScreen {
		static let firstHalf: CGFloat = 5
		static let secondHalf: CGFloat = 35
		static let thirdHalf: CGFloat = 65
	}
}
