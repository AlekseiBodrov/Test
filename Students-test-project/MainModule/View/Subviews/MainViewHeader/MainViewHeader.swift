//
//  MainViewHeader.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainViewHeader: UIView {

    //MARK: - let/var
    lazy var titleLabel = UILabel()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - flow funcs
    private func configure() {
        titleLabel.textAlignment = .left
        titleLabel.font = Resources.Fonts.sfProDisplayBold(with: .l)
        titleLabel.textColor = .secondaryColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .mplus),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .mplus),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    //MARK: - public
    func setupTitle(with text: String) {
        titleLabel.text = text
    }
}
