//
//  MainPresenter.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//
import Foundation

protocol MainPresenterProtocol: AnyObject {
    func presentBackgroundImage(with name: String)
    func presentTitleLabel(title: String)
    func presentFirstDescription(text: String)
    func presentSecondDescription(text: String)
    func presentСategories(category: [Category])
    func presentAlert()
}

typealias PresenterDelegate = MainPresenterProtocol

final class MainPresenter {

    //MARK: - delegate
    weak var delegate: PresenterDelegate?

    //MARK: - flow funcs
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }

    func getBackgroundImage() {
        let name = Resources.Images.background
        delegate?.presentBackgroundImage(with: name)
    }

    func getTitleLabel() {
        let title = Resources.String.Label.titleLabel
        delegate?.presentTitleLabel(title: title)
    }

    func getFirstDescription() {
        let text = Resources.String.Label.firstDescription
        delegate?.presentFirstDescription(text: text)
    }

    func getSecondDescription() {
        let text = Resources.String.Label.secondDescription
        delegate?.presentSecondDescription(text: text)
    }

    func getСategories() {
        var categoriesArray: [Category] = []
        for _ in 0...50 {
            Categorys.allCases.forEach {
                categoriesArray.append(Category(name: $0.rawValue, isSelected: false))
            }
        }
        delegate?.presentСategories(category: categoriesArray)
    }

    func didTapSendButton() {
        delegate?.presentAlert()
    }
}
