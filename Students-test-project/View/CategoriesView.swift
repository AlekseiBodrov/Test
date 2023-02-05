//
//  CategoriesView.swift
//  Students-test-project
//
//  Created by Алексей on 03.02.2023.
//

import UIKit

final class CategoriesView: UIView {

    //MARK: - var\let
    lazy var categoriesArray = [""]

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
        collection.register(CategoriesViewCell.self, forCellWithReuseIdentifier: CategoriesViewCell.identifier)

        addSubview(collection)
        collection.backgroundColor = .white
    }
}

//MARK: - extension
extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: .mplus, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .s
    }

    func getTextWidth(_ string: String) -> CGFloat {
        let rect = string.boundingRect(with: CGSize(width: 0, height: 0),
                                       options: .usesFontLeading,
                                       attributes: [.font: UIFont.systemFont(ofSize: .xl)],
                                       context: nil).size
        return rect.width
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = categoriesArray[indexPath.row]
        let width = getTextWidth(text)
        let height = CGFloat(44)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesViewCell.identifier, for: indexPath) as? CategoriesViewCell else {return UICollectionViewCell()}
        cell.configure(with: categoriesArray[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? CategoriesViewCell {
            cell.didSelectItem()
        }

        let message = ["indexPath" : indexPath]
        NotificationCenter.default.post(name: NSNotification.Name("didSelectCategory"), object: nil, userInfo: message)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoriesViewCell {
            cell.didDeselectItem()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        
    }

}

