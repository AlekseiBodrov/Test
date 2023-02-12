//
//  MainCollectionViewCell.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    // MARK: - static
    static let identifier = "MainCollectionViewCell"

    // MARK: - constant
    private enum Constant {
        static let radius: CGFloat = .sSize
        static let padding: CGFloat = .sSize
        static let labelFont = Resources.Fonts.sfProDisplayMedium(with: .splusSize)
    }

    // MARK: - property
    private lazy var view = UIView()
    private lazy var label = UILabel()

    override var isSelected: Bool {
        didSet {
            self.view.backgroundColor = self.isSelected ? Color.secondaryColor : Color.lightSecondaryColor
            self.label.textColor = self.isSelected ? Color.mainColor : Color.secondaryColor
        }
    }

    // MARK: - life cycle funcs
    private override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - public
    func configureLabel(with text: String) {
        label.text = text
    }
}

extension MainCollectionViewCell {

    // MARK: - flow funcs
    private func configure() {
        addSubview(view)
        view.addSubview(label)
        setConstraint()

        view.create(backgroundColor: Color.lightSecondaryColor)
        view.rounded(radius: Constant.radius)
        label.create(backgroundColor: .clear)
        label.textAlignment = .center
        label.textColor = Color.secondaryColor
        label.font = Constant.labelFont
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.padding),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),

            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
