//
//  TitleView.swift
//  Students-test-project
//
//  Created by Алексей on 04.02.2023.
//

import UIKit

final class TitleView: UIView {

    //MARK: - var\let
    let titleLabel = UILabel()

    //MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: .l)

        backgroundColor = .white

        addSubview(titleLabel)
    }

    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .l),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .mplus),
            titleLabel.heightAnchor.constraint(equalToConstant: .xl),
        ])
    }
}
