//
//  MainView.swift
//  Students-test-project
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

final class MainView: UIView {

    // MARK: - constant
    private enum Constant {
        static let headerViewHeight: CGFloat = 56
        static let firstDescriptionViewHeight: CGFloat = 84
        static let secondDescriptionViewHeight: CGFloat = 64
        static let firstCollectionHeight: CGFloat = .minBtn
        static let secondCollectionHeight: CGFloat = 100
    }

    // MARK: - property
    lazy var headerView = MainViewHeader()

    lazy var firstDescriptionView = MainDescriptionView()
    lazy var firstCollectionView = MainHorizontalMenuView()

    lazy var secondDescriptionView = MainDescriptionView()
    lazy var secondCollectionView = MainHorizontalMenuView()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - flow funcs
    private func configure() {
        addSubViews()
//        configureHeaderView()
        configureDescriptionView()
        configureCollectionView()
    }

    private func addSubViews() {
        addSubview(headerView)
        addSubview(firstDescriptionView)
        addSubview(secondDescriptionView)
        addSubview(firstCollectionView)
        addSubview(secondCollectionView)
    }

    private func configureDescriptionView() {
        firstDescriptionView.create(backgroundColor: Color.mainColor)
        secondDescriptionView.create(backgroundColor: Color.mainColor)
    }

    private func configureCollectionView() {
        firstCollectionView.create(backgroundColor: Color.mainColor)
        secondCollectionView.create(backgroundColor: Color.mainColor)
    }

   func setConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constant.headerViewHeight),

            firstDescriptionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            firstDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstDescriptionView.heightAnchor.constraint(equalToConstant: Constant.firstDescriptionViewHeight),

            firstCollectionView.topAnchor.constraint(equalTo: firstDescriptionView.bottomAnchor),
            firstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstCollectionView.heightAnchor.constraint(equalToConstant: Constant.firstCollectionHeight),

            secondDescriptionView.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor),
            secondDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondDescriptionView.heightAnchor.constraint(equalToConstant: Constant.secondDescriptionViewHeight),

            secondCollectionView.topAnchor.constraint(equalTo: secondDescriptionView.bottomAnchor),
            secondCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondCollectionView.heightAnchor.constraint(equalToConstant: Constant.secondCollectionHeight)
        ])
    }
}
