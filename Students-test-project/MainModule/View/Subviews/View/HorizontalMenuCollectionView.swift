//
//  HorizontalMenuCollectionView.swift
//  Students-test-project
//
//  Created by Алексей on 11.02.2023.
//

import UIKit

final class HorizontalMenuView: UIView {

    //MARK: - constants
    enum SizeConstant {
        static let spacing: CGFloat = .s
        static let padding: CGFloat = .mplus
        static let fontHeight: CGFloat = .splus
        static let height: CGFloat = .minBtn
    }

    //MARK: - property
    lazy var categoriesArray: [Category] = .init()
    lazy var categoriesArray2: [Category] = categoriesArray.reversed()
    private lazy var collection1: UICollectionView = .init()
    private lazy var collection2: UICollectionView = .init()

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
extension HorizontalMenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collection1.contentOffset = scrollView.contentOffset
        collection2.contentOffset = scrollView.contentOffset


        //        if scrollView.contentOffset.y < 0.0 {
        //            backgroundImageView.constraints
        //            self.backgroundImageView.constant = 250 - (scrollView.contentOffset.y)
        //            self.top_imgView.constant = scrollView.contentOffset.y
        //            self.trailling_ImgView.constant = (scrollView.contentOffset.y)
        //            self.leading_ImgView.constant =  (scrollView.contentOffset.y)
        //        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: 0,
                            right: SizeConstant.padding)
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
        categoriesArray[indexPath.item].isSelected = true
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell else { return }
//        cell.didSelect()
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        categoriesArray[indexPath.item].isSelected = false
        for i in 0..<categoriesArray2.count {
            categoriesArray2[i].isSelected = false
        }
        collection2.reloadData()
//        categoriesArray2 = categoriesArray2.map { $0.isSelected = false }
        collectionView.reloadData()
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainCollectionViewCell else { return }
//        cell.didDeselect()
    }
}

//MARK: - extension
extension HorizontalMenuView {

    //MARK: - flow funcs
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collection1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection2 = UICollectionView(frame: .zero, collectionViewLayout: layout)

        addSubview(collection1)
        addSubview(collection2)
        setConstraints()

        collection1.delegate = self
        collection1.dataSource = self
        collection1.clipsToBounds = false
        collection1.backgroundColor = Color.mainColor
        collection1.showsHorizontalScrollIndicator = false
        collection1.translatesAutoresizingMaskIntoConstraints = false
        collection1.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)

        collection2.delegate = self
        collection2.dataSource = self
        collection2.clipsToBounds = false
        collection2.backgroundColor = Color.mainColor
        collection2.showsHorizontalScrollIndicator = false
        collection2.translatesAutoresizingMaskIntoConstraints = false
        collection2.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            collection1.topAnchor.constraint(equalTo: topAnchor),
            collection1.bottomAnchor.constraint(equalTo: collection2.topAnchor),
            collection1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            collection1.heightAnchor.constraint(equalTo: collection2.heightAnchor),
            collection1.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection2.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            collection2.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    private func createCell(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell  {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {return UICollectionViewCell()}
        if categoriesArray[indexPath.item].isSelected {
//            cell.didSelect()
        } else {
//            cell.didDeselect()
        }
        if collectionView == collection1 {
            cell.configureLabel(with: categoriesArray[indexPath.item].name)
        } else {
            cell.configureLabel(with: categoriesArray2[indexPath.item].name)
        }
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
        collection1.scrollToItem(at: IndexPath(row: 200, section: 0), at: .left, animated: false)
        collection2.scrollToItem(at: IndexPath(row: 200, section: 0), at: .left, animated: false)
    }
}
