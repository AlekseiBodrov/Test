//
//  MainViewHeader.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainViewHeader: UIView {

    //MARK: - constant
    private enum Constant {
        static let headerViewHeight: CGFloat = 56
        static let headerViewRadius: CGFloat = 32
        static let descriptionView1Height: CGFloat = 84
        static let descriptionView2Height: CGFloat = 64
        static let collection1Height: CGFloat = .minBtn
        static let collection2Height: CGFloat = 100
    }
    
    //MARK: - property
    lazy var titleLabel = UILabel()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }

    //MARK: - flow funcs
    private func configure() {
        titleLabel.textAlignment = .left
        titleLabel.font = Resources.Fonts.sfProDisplayBold(with: .l)
        titleLabel.textColor = Color.secondaryColor
        titleLabel.create(backgroundColor: .clear)
        addSubview(titleLabel)
    }

    //MARK: - public
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .mplus),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .mplus),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupTitle(with text: String) {
        titleLabel.text = text
    }
}
