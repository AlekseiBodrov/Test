//
//  headerTableView.swift
//  Students-test-project
//
//  Created by Алексей on 03.02.2023.
//

import UIKit

final class BackgroundView: UIView {

    //MARK: - var\let
    private let backgroundImageView = UIImageView()

    //MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - flow funcs
    private func setup() {
        backgroundImageView.frame = bounds
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = false

        addSubview(backgroundImageView)
    }

    //MARK: - public
    func setupImage(_ image: UIImage) {
        backgroundImageView.image = image
    }
}


