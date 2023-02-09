//
//  MainCollectionViewCell.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {

    //MARK: - static
    static let identifier = "MainCollectionViewCell"

    //MARK: - let/var
    private enum Constant {
        static let radius: CGFloat = .s
    }

    private lazy var label = UILabel()

    // MARK: - init
    private override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - public
    func configureLabel(with text: String) {
        label.text = text
    }

    func didSelectItem() {
        backgroundColor = .darkGray
        label.textColor = .white
    }

    func didDeselectItem() {
        backgroundColor = .lightGray
        label.textColor = .black
    }
}

extension MainCollectionViewCell {

    //MARK: - flow funcs
    private func configure() {
        label.textAlignment = .center
        label.textColor = .black
        label.font = Resources.Fonts.sfProDisplayMedium(with: .splus)
        label.translatesAutoresizingMaskIntoConstraints = false

        backgroundColor = .lightGray
        rounded(radius: Constant.radius)

        contentView.addSubview(label)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
