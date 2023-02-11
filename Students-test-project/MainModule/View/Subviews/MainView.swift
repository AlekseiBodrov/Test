//
//  MainView.swift
//  Students-test-project
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

final class MainView: UIView {

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
    lazy var headerView = MainViewHeader()

    lazy var descriptionView1 = MainDescriptionView()
    lazy var collectionView1 = MainHorizontalMenuView()

    lazy var descriptionView2 = MainDescriptionView()
    lazy var collectionView2 = MainCategoriesMenuView()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - flow funcs
    private func configure() {
        configureHeaderView()
        configureDescriptionView1()
        configureCollectionView1()
        configureDescriptionView2()
        configureCollectionView2()
    }

    private func configureHeaderView() {
        addSubview(headerView)
        headerView.layer.cornerRadius = Constant.headerViewRadius
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        headerView.create(backgroundColor: Color.mainColor)
    }

    private func configureDescriptionView1() {
        addSubview(descriptionView1)
        descriptionView1.create(backgroundColor: Color.mainColor)
    }

    private func configureDescriptionView2() {
        addSubview(descriptionView2)
        descriptionView2.create(backgroundColor: Color.mainColor)
    }

    private func configureCollectionView1() {
        addSubview(collectionView1)
        collectionView1.create(backgroundColor: Color.mainColor)
    }

    private func configureCollectionView2() {
        addSubview(collectionView2)
        collectionView2.create(backgroundColor: Color.mainColor)
    }

   func setConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constant.headerViewHeight),

            descriptionView1.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            descriptionView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionView1.heightAnchor.constraint(equalToConstant: Constant.headerViewHeight),

            collectionView1.topAnchor.constraint(equalTo: descriptionView1.bottomAnchor),
            collectionView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView1.heightAnchor.constraint(equalToConstant: Constant.headerViewHeight),

            descriptionView2.topAnchor.constraint(equalTo: collectionView1.bottomAnchor),
            descriptionView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionView2.heightAnchor.constraint(equalToConstant: Constant.descriptionView2Height),

            collectionView2.topAnchor.constraint(equalTo: descriptionView2.bottomAnchor),
            collectionView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView2.heightAnchor.constraint(equalToConstant: Constant.collection2Height),
        ])
    }
}
