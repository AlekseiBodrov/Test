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
    var isPicked = false

    //MARK: - life cycle funcs
    private override init(frame: CGRect) {
        super.init(frame: frame)
        configure()


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraint()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        if isPicked {
            didSelectItem()
        } else {
            didDeselectItem()
        }
    }

    //MARK: - public
    func configureLabel(with text: String) {
        label.text = text
    }

    func didSelectItem() {
        backgroundColor = Color.secondaryColor
        label.textColor = Color.mainColor
        isPicked = true
    }

    func didDeselectItem() {
        backgroundColor = Color.lightSecondaryColor
        label.textColor = Color.secondaryColor
        isPicked = false
    }


}

extension MainCollectionViewCell {

    //MARK: - flow funcs
    private func configure() {
        label.textAlignment = .center
        label.textColor = Color.secondaryColor
        label.font = Resources.Fonts.sfProDisplayMedium(with: .splus)
        label.translatesAutoresizingMaskIntoConstraints = false

        backgroundColor = Color.lightSecondaryColor
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
