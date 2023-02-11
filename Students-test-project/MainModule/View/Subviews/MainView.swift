//
//  MainView.swift
//  Students-test-project
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

final class MainView: UIView {

    //MARK: - let/var
    lazy var headerView = MainViewHeader()

    lazy var descriptionView1 = MainDescriptionView()
    lazy var collectionView1 = CategoriesView()

    lazy var descriptionView2 = MainDescriptionView()
    lazy var collectionView2 = CategoriesView()

    // MARK: - Init
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
        headerView.backgroundColor = Color.mainColor
        headerView.layer.cornerRadius = 32
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        headerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerView)

    }

    private func configureDescriptionView1() {
        descriptionView1.translatesAutoresizingMaskIntoConstraints = false
        descriptionView1.backgroundColor = Color.mainColor

        addSubview(descriptionView1)
    }

    private func configureDescriptionView2() {
        descriptionView2.translatesAutoresizingMaskIntoConstraints = false
        descriptionView2.backgroundColor = Color.mainColor

        addSubview(descriptionView2)
    }

    private func configureCollectionView1() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 12
//
//        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
////        collectionView1.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
//        collectionView1.alwaysBounceHorizontal = true
//        collectionView1.showsVerticalScrollIndicator = false
//        collectionView1.showsHorizontalScrollIndicator = false
//        collectionView1.backgroundView = UIView()
//        collectionView1.backgroundView?.backgroundColor = .cyan

        collectionView1.translatesAutoresizingMaskIntoConstraints = false
//
//        collectionView1.delegate = self
//        collectionView1.dataSource = self
//        collectionView1.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        addSubview(collectionView1)
    }

    private func configureCollectionView2() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 12
//
//        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView2.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
//        collectionView2.register(UICollectionViewCell.self,
//                                forCellWithReuseIdentifier: "UICollectionViewCell")
//        collectionView2.alwaysBounceHorizontal = true
//        collectionView2.showsVerticalScrollIndicator = false
//        collectionView2.showsHorizontalScrollIndicator = false
//        collectionView2.backgroundView = UIView()
//        collectionView2.backgroundView?.backgroundColor = .yellow
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView2)
    }

   func setConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 56),

            descriptionView1.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            descriptionView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionView1.heightAnchor.constraint(equalToConstant: 84),

            collectionView1.topAnchor.constraint(equalTo: descriptionView1.bottomAnchor),
            collectionView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView1.heightAnchor.constraint(equalToConstant: 44),

            descriptionView2.topAnchor.constraint(equalTo: collectionView1.bottomAnchor),
            descriptionView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionView2.heightAnchor.constraint(equalToConstant: 64),

            collectionView2.topAnchor.constraint(equalTo: descriptionView2.bottomAnchor),
            collectionView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView2.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
