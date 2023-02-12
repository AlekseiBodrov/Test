//
//  MainViewHeader.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainViewHeader: UIView {

    // MARK: - constant
    private enum Constant {
        static let padding: CGFloat = .mplusSize
        static let titleLabelFont = Resources.Fonts.sfProDisplayBold(with: .lSize)
    }

    // MARK: - property
    lazy var titleLabel = UILabel()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - flow funcs
    private func configure() {
        addSubViews()
        setConstraints()

        titleLabel.textAlignment = .left
        titleLabel.font = Constant.titleLabelFont
        titleLabel.textColor = Color.secondaryColor
        titleLabel.create(backgroundColor: .clear)
    }

    private func addSubViews() {
        addSubview(titleLabel)
    }

    // MARK: - public
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.padding),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupTitle(with text: String) {
        titleLabel.text = text
    }
}
