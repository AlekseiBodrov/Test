//
//  headerTableView.swift
//  Students-test-project
//
//  Created by Алексей on 03.02.2023.
//

import UIKit

final class BackgroundView: UIView {

    //MARK: - var\let

    private enum Constant {
        static let imageHeight: CGFloat = 713
        static let imageWidth: CGFloat = 713
    }

    private let backgroundImageView = UIImageView()

    //MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        let size = CGSize(width: bounds.width, height: bounds.height)
        backgroundImageView.frame = .init(x: 0, y: 0, width: size.width, height: size.height)


        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        backgroundImageView.widthAnchor.constraint(equalToConstant: Constant.imageHeight).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: Constant.imageWidth).isActive = true
//        backgroundImageView.topAnchor.constraint(equalTo: .topAnchor, constant: -99).isActive = true
//        backgroundImageView.leadingAnchor.constraint(equalTo: .leadingAnchor, constant: -169).isActive = true
    }

    //MARK: - flow funcs
    private func setup() {
        addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = false
        backgroundImageView.image = UIImage(named: "image")
//        backgroundImageView.fill
    }
}
