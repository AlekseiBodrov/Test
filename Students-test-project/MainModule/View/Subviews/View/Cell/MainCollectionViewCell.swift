//
//  MainCollectionViewCell.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    //MARK: - static
    static let identifier = "MainCollectionViewCell"

    //MARK: - let/var
    private enum Constant {
        static let radius: CGFloat = .s
        static let padding: CGFloat = .s
    }
    private lazy var view = UIView()
    private lazy var label = UILabel()

    override var isSelected: Bool {
        didSet {
            view.backgroundColor = self.isSelected ? Color.secondaryColor : Color.lightSecondaryColor
            label.textColor = self.isSelected ? Color.mainColor : Color.secondaryColor
        }
    }

    //MARK: - life cycle funcs
    private override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - public
    func configureLabel(with text: String) {
        label.text = text
    }
}

extension MainCollectionViewCell {

    //MARK: - flow funcs
    private func configure() {
        addSubview(view)
        view.addSubview(label)

        setConstraint()

//        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = Color.secondaryColor
        label.font = Resources.Fonts.sfProDisplayMedium(with: .splus)
        label.translatesAutoresizingMaskIntoConstraints = false

        backgroundColor = Color.lightSecondaryColor
        view.rounded(radius: Constant.radius)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),

            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}





    /*
     //
     //  MainCollectionViewCell.swift
     //  Students-test-project
     //
     //  Created by Алексей on 09.02.2023.
     //

     import UIKit

     final class MainCollectionViewCell: UICollectionViewCell {
         //MARK: - static
         static let identifier = "MainCollectionViewCell"

         //MARK: - let/var
         private enum Constant {
             static let radius: CGFloat = .s
             static let padding: CGFloat = .s
         }
         private lazy var view = UIView()
         private lazy var label = UILabel()

         //MARK: - life cycle funcs
         private override init(frame: CGRect) {
             super.init(frame: frame)
             configure()
         }

         required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }

         //MARK: - public
         func configureLabel(with text: String) {
             label.text = text
         }

         func didSelect() {
             backgroundColor = Color.secondaryColor
             label.textColor = Color.mainColor
         }

         func didDeselect() {
             backgroundColor = Color.lightSecondaryColor
             label.textColor = Color.secondaryColor
         }
     }

     extension MainCollectionViewCell {

         //MARK: - flow funcs
         private func configure() {
             addSubview(view)
             view.addSubview(label)

             setConstraint()

     //        view.backgroundColor = .blue
             view.translatesAutoresizingMaskIntoConstraints = false
             label.textAlignment = .center
             label.textColor = Color.secondaryColor
             label.font = Resources.Fonts.sfProDisplayMedium(with: .splus)
             label.translatesAutoresizingMaskIntoConstraints = false

             backgroundColor = Color.lightSecondaryColor
             rounded(radius: Constant.radius)
         }

         private func setConstraint() {
             NSLayoutConstraint.activate([
                 view.topAnchor.constraint(equalTo: topAnchor),
                 view.bottomAnchor.constraint(equalTo: bottomAnchor),
                 view.leadingAnchor.constraint(equalTo: leadingAnchor),
                 view.trailingAnchor.constraint(equalTo: trailingAnchor),

                 label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                 label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             ])
         }
     }

     */
