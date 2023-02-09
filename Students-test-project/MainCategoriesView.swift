//
//  MainCategoriesView.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class CategoriesView: UIView {

    //MARK: - var\let
    lazy var categoriesArray: [String] = .init()

    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        return view
    }()

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
        collection.frame = .init(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
    }

    //MARK: - flow funcs
    private func setup() {
        contentMode = .left
        collection.delegate = self
        collection.dataSource = self
        collection.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)

        addSubview(collection)
        collection.backgroundColor = .white
        collection.clipsToBounds = false
    }
}

//MARK: - extension
extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: .mplus, bottom: 0, right: .mplus)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .s
    }

    func getTextWidth(_ string: String) -> CGFloat {
        let rect = string.boundingRect(with: CGSize(width: 0, height: 0),
                                       options: .usesFontLeading,
                                       attributes: [.font: Resources.Fonts.sfProDisplayMedium(with: .splus)],
                                       context: nil).size
        return rect.width
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = categoriesArray[indexPath.row]
        let width = .l + getTextWidth(text) + .l
        let height = CGFloat(44)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {return UICollectionViewCell()}
        cell.configureLabel(with: categoriesArray[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell {
            cell.didSelectItem()
        }

        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)

        let message = ["indexPath" : indexPath]
        NotificationCenter.default.post(name: NSNotification.Name("didSelectCategory"), object: nil, userInfo: message)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell {
            cell.didDeselectItem()
        }
    }
}

