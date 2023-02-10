//
//  MainCategoriesView.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

enum CategoriesViewSizeConstants {
    static let spacing: CGFloat = .s
    static let padding: CGFloat = .mplus
    static let fontHeight: CGFloat = .splus
    static let height: CGFloat = .minBtn
}

final class CategoriesView: UIView {

    //MARK: - var\let
    lazy var categoriesArray: [Category] = .init()
    private lazy var collection: UICollectionView = .init()

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
        setConstraints()
    }
}

//MARK: - extension
extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: 0,
                            right: CategoriesViewSizeConstants.padding)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CategoriesViewSizeConstants.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForTextLabel(for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return createCell(indexPath: indexPath, collectionView: collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell else { return }
        cell.didSelectItem()
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell else { return }
        cell.didDeselectItem()
    }
}

extension CategoriesView {

    //MARK: - flow funcs
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collection.delegate = self
        collection.dataSource = self
        collection.clipsToBounds = false
        collection.backgroundColor = .mainColor
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        addSubview(collection)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    private func createCell(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell  {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {return UICollectionViewCell()}
        cell.configureLabel(with: categoriesArray[indexPath.item].name)
        cell.isPicked = categoriesArray[indexPath.item].isSelected
        return cell
    }

    private func getTextWidth(_ string: String) -> CGFloat {
        let rect = string.boundingRect(with: CGSize(width: 0, height: 0),
                                       options: .usesFontLeading,
                                       attributes: [.font: Resources.Fonts.sfProDisplayMedium(with: CategoriesViewSizeConstants.fontHeight)],
                                       context: nil).size
        return rect.width
    }

    private func sizeForTextLabel(for indexPath: IndexPath) -> CGSize {
        let text = categoriesArray[indexPath.row].name
        let width = .l + getTextWidth(text) + .l
        let height = CategoriesViewSizeConstants.height
        return CGSize(width: width, height: height)
    }
}
