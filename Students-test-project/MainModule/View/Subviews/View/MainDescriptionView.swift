//
//  MainDescriptionView.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainDescriptionView: UIView {

    //MARK: - constant
    enum Constant {
        static let padding: CGFloat = .mplus
        static let titleLabelFont = Resources.Fonts.sfProDisplayRegular(with: .splus)
    }

    //MARK: - property
    private lazy var titleLabel = UILabel()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - flow funcs
    private func configure() {
        addSubview(titleLabel)
        setConstraints()

        titleLabel.textAlignment = .left
        titleLabel.font = Constant.titleLabelFont
        titleLabel.numberOfLines = 0
        titleLabel.textColor = Color.secondaryTextColor
        titleLabel.create(backgroundColor: .clear)
    }

    //MARK: - public
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.padding),
        ])
    }

    func setupTitle(with text: String) {
        titleLabel.text = text
    }
}
