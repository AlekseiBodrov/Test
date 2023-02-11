//
//  MainCategoriesView.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class CategoriesView: UIView {

    //MARK: - constants
    enum SizeConstant {
        static let spacing: CGFloat = .s
        static let padding: CGFloat = .mplus
        static let fontHeight: CGFloat = .splus
        static let height: CGFloat = .minBtn
    }

    //MARK: - property
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
}

//MARK: - extension UICollectionViewDelegate
extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        categoriesArray[indexPath.item].isSelected = true
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}

//MARK: - extension
extension CategoriesView {

    //MARK: - flow funcs
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: SizeConstant.padding, bottom: 0, right: SizeConstant.padding)
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

        addSubview(collection)
        setConstraints()


        collection.delegate = self
        collection.dataSource = self
        collection.clipsToBounds = false
        collection.backgroundColor = Color.mainColor
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collection.backgroundColor = .red
        collection.selectItem(at: [0, 0], animated: true, scrollPosition: [])
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
        return cell
    }

    private func sizeForTextLabel(for indexPath: IndexPath) -> CGSize {
        let categoryFont = Resources.Fonts.sfProDisplayMedium(with: .splus)
        let categoryAttributes = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = categoriesArray[indexPath.item].name.size(withAttributes: categoryAttributes).width + .l + .l
        let height = SizeConstant.height
        return CGSize(width: categoryWidth, height: height)
    }

    //MARK: - public funcs
    func setPositinonCollection() {
        collection.scrollToItem(at: IndexPath(row: 200, section: 0), at: .left, animated: false)
    }
}

















































/*
 //
 //  MainCategoriesView.swift
 //  Students-test-project
 //
 //  Created by Алексей on 09.02.2023.
 //

 import UIKit

 final class CategoriesView: UIView {

     //MARK: - constants
     enum SizeConstant {
         static let spacing: CGFloat = .s
         static let padding: CGFloat = .mplus
         static let fontHeight: CGFloat = .splus
         static let height: CGFloat = .minBtn
     }

     //MARK: - property
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
 }

 //MARK: - extension UICollectionViewDelegate
 extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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
         categoriesArray[indexPath.item].isSelected = true
         collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
         guard let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell else { return }
         cell.didSelect()
     }

     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         categoriesArray[indexPath.item].isSelected = false
         collectionView.reloadData()
         guard let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell else { return }
         cell.didDeselect()
     }
 }

 //MARK: - extension
 extension CategoriesView {

     //MARK: - flow funcs
     private func setup() {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.minimumLineSpacing = 0
         layout.minimumInteritemSpacing = 12
         layout.sectionInset = UIEdgeInsets(top: 0, left: SizeConstant.padding, bottom: 0, right: SizeConstant.padding)
         collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

         addSubview(collection)
         setConstraints()


         collection.delegate = self
         collection.dataSource = self
         collection.clipsToBounds = false
         collection.backgroundColor = Color.mainColor
         collection.showsHorizontalScrollIndicator = false
         collection.translatesAutoresizingMaskIntoConstraints = false
         collection.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
         collection.backgroundColor = .red
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
         if categoriesArray[indexPath.item].isSelected {
             cell.didSelect()
         } else {
             cell.didDeselect()
         }
         cell.configureLabel(with: categoriesArray[indexPath.item].name)

         return cell
     }

     private func sizeForTextLabel(for indexPath: IndexPath) -> CGSize {
         let categoryFont = Resources.Fonts.sfProDisplayMedium(with: .splus)
         let categoryAttributes = [NSAttributedString.Key.font: categoryFont as Any]
         let categoryWidth = categoriesArray[indexPath.item].name.size(withAttributes: categoryAttributes).width + .l + .l
         let height = SizeConstant.height
         return CGSize(width: categoryWidth, height: height)
     }

     //MARK: - public funcs
     func setPositinonCollection() {
         collection.scrollToItem(at: IndexPath(row: 200, section: 0), at: .left, animated: false)
     }
 }

 */
