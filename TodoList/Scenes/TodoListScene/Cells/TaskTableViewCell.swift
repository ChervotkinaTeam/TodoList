//
//  TaskTableViewCell.swift
//  TodoList
//
//  Created by Елена Червоткина on 03.04.2023.
//

import UIKit
import PinLayout

class TaskTableViewCell: UITableViewCell {
	static let reuseIdentifier = "TaskCell"

	lazy var labelTitle: UILabel = makeLabelTitle()
	lazy var labelDate: UILabel = makeLabelDate()
	lazy var imageViewDone: UIImageView = makeImageView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		layout()
	}

	override func sizeThatFits(_ size: CGSize) -> CGSize {
		contentView.pin.width(size.width)
		layout()
		let height = (labelDate.text == "" ? labelTitle.frame.maxY : labelDate.frame.maxY) + Sizes.Padding.half
		return CGSize(width: contentView.frame.width, height: height)
	}

	func configure(task: TodoListModel.ViewModel.Task) {
		switch task {
		case .importantTask(let task):
			let redText = [NSAttributedString.Key.foregroundColor: Theme.red]
			let taskText = NSMutableAttributedString(string: "\(task.priority) ", attributes: redText )
			taskText.append(NSAttributedString(string: task.name))

			labelTitle.attributedText = taskText
			labelDate.text = task.deadLine
			labelDate.textColor = task.isOverdue ? Theme.red : Theme.black

			imageViewDone.isHidden = !task.isDone
		case .regularTask(let task):
			labelTitle.text = task.name
			labelDate.text = ""
			imageViewDone.isHidden = !task.isDone
		}
	}
}

// MARK: - Private extensions
private extension TaskTableViewCell {
	func setupUI() {
		[
			labelTitle,
			labelDate,
			imageViewDone
		].forEach { contentView.addSubview($0) }
	}

	func layout() {
		imageViewDone.pin
			.right(Sizes.Padding.normal)
			.vCenter()
			.sizeToFit()

		labelTitle.pin
			.top(Sizes.Padding.half)
			.left(Sizes.Padding.normal)
			.before(of: imageViewDone)
			.marginRight(Sizes.Padding.half)
			.sizeToFit(.width)

		labelDate.pin
			.bottom(Sizes.Padding.half)
			.left(Sizes.Padding.normal)
			.below(of: labelTitle)
			.marginTop(Sizes.Padding.half)
			.before(of: imageViewDone)
			.marginRight(Sizes.Padding.half)
			.sizeToFit(.width)
	}

	func makeImageView() -> UIImageView {
		let imageView = UIImageView()

		imageView.image = Asset.done.image.withTintColor(Theme.red)

		return imageView
	}

	func makeLabelTitle() -> UILabel {
		let label = UILabel()

		label.numberOfLines = 0
		label.textColor = Theme.black
		label.font = UIFont.boldSystemFont(ofSize: 19)

		return label
	}

	func makeLabelDate() -> UILabel {
		let label = UILabel()

		label.numberOfLines = 0
		label.textColor = Theme.black
		label.font = UIFont.systemFont(ofSize: 16)

		return label
	}
}
