//
//  CategoriesViewCell.swift
//  Students-test-project
//
//  Created by Алексей on 03.02.2023.
//

import UIKit

final class CategoriesViewCell: UICollectionViewCell {
    static let identifier = "CategoriesViewCell"
    
    //MARK: - var\let
    private enum Constant {
        static let radius: CGFloat = .s
    }

    let view = UIView()
    let label = UILabel()

    //MARK: - public
    func configure(with name: String) {
        view.addSubview(label)
        contentView.addSubview(view)

        label.text = name
        label.textAlignment = .center
        label.textColor = .black
        label.font = Resources.Fonts.sfProDisplayMedium(with: .splus)

        view.backgroundColor = .lightGray
        view.rounded(radius: Constant.radius)

        setConstraint()
    }

    func didSelectItem() {
        view.backgroundColor = .darkGray
        label.textColor = .white
    }

    func didDeselectItem() {
        view.backgroundColor = .lightGray
        label.textColor = .black
    }

    //MARK: - flow funcs
    private func setConstraint() {
        view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

