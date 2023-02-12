//
//  MainCategoriesView.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainHorizontalMenuView: UIView {

    // MARK: - constant
    enum Constant {
        static let padding: CGFloat = .mplusSize
        static let buttonHeight: CGFloat = .minBtn
    }

    // MARK: - property
    lazy var categoriesArray: [Category] = .init()
    private lazy var collection: UICollectionView = .init()

    // MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collection.selectItem(at: [0, 100], animated: false, scrollPosition: .left)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extension UICollectionViewDelegate
extension MainHorizontalMenuView: UICollectionViewDelegate,
                                    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForTextLabel(for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return createCell(indexPath: indexPath, collectionView: collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectItem(for: indexPath, collectionView: collectionView)
    }
}

// MARK: - extension
extension MainHorizontalMenuView {

    // MARK: - flow funcs
    private func setup() {
        collectionLayout()
        addSubview(collection)
        setConstraints()

        collection.delegate = self
        collection.dataSource = self
        collection.clipsToBounds = false
        collection.showsHorizontalScrollIndicator = false
        collection.create(backgroundColor: Color.mainColor)
        collection.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .xsSize),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func createCell(indexPath: IndexPath,
                            collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()}
        cell.configureLabel(with: categoriesArray[indexPath.item].name)
        return cell
    }

    private func sizeForTextLabel(for indexPath: IndexPath) -> CGSize {
        let categoryFont = Resources.Fonts.sfProDisplayMedium(with: .splusSize)
        let categoryAttributes = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = categoriesArray[indexPath.item].name.size(
            withAttributes: categoryAttributes).width + .sSize + .lSize + .lSize
        let height = Constant.buttonHeight
        return CGSize(width: categoryWidth, height: height)
    }

    private func selectItem(for indexPath: IndexPath, collectionView: UICollectionView) {
        if categoriesArray[indexPath.item].isSelected {
            categoriesArray[indexPath.item].isSelected = false
            collectionView.reloadData()
        } else {
            categoriesArray[indexPath.item].isSelected = true
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }

    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: Constant.padding, bottom: 0, right: Constant.padding)
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
}
