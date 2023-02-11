//
//  MainDescriptionView.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainDescriptionView: UIView {

    //MARK: - let/var
    private lazy var titleLabel = UILabel()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - flow funcs
    private func configure() {

//        Важно последовательность
        addSubview(titleLabel)

        setConstraints()

//        titleLabel.frame = bounds

        titleLabel.textAlignment = .left
        titleLabel.font = Resources.Fonts.sfProDisplayRegular(with: .splus)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = Color.secondaryTextColor
        titleLabel.backgroundColor = Color.mainColor

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

    }

 
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .mplus),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.mplus),
        ])
    }

    //MARK: - public
    func setupTitle(with text: String) {
        titleLabel.text = text
    }
}
