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

    override func layoutSubviews() {
        super.layoutSubviews()
        let size = CGSize(width: bounds.width, height: 56)
//        titleLabel.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
    }

    //MARK: - flow funcs
    func setup(with text: String) {
        titleLabel.text = text
    }

    private func configure() {

        backgroundColor = .white

        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)

        addSubview(titleLabel)

        titleLabel.backgroundColor = .white
    }




    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
}
