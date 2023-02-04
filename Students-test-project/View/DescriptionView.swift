//
//  DescriptionView.swift
//  Students-test-project
//
//  Created by Алексей on 04.02.2023.
//

import UIKit

final class DescriptionView: UIView {

    //MARK: - let/var
    private enum Constant {
        static let topPadding: CGFloat = 12
        static let padding: CGFloat = 20
    }

    let titleLabel = UILabel()

    //MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)

        configure()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - flow funcs
    func setup(with text: String) {
        titleLabel.text = text
    }

    private func configure() {
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .gray
        titleLabel.backgroundColor = .white
    }

    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.topPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.padding),
        ])
    }
}
