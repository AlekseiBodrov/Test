//
//  Presenter.swift
//  Students-test-project
//
//  Created by Алексей on 05.02.2023.
//

import UIKit

protocol MainPresenterDelegate: AnyObject {
    func presentBackgroundImage(image: UIImage)
    func presentTitleLabel(title: String)
    func presentFirstDescription(text: String)
    func presentSecondDescription(text: String)
    func presentСategories(category: [String])
    func presentAlert()
}

typealias PresenterDelegate = MainPresenterDelegate & UIViewController

final class MainPresenter {

    //MARK: - let/var
    weak var delegate: PresenterDelegate?

    //MARK: - flow funcs
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }

    func getBackgroundImage() {
        guard let image = Resources.Images.background else { return }
        delegate?.presentBackgroundImage(image: image)
    }

    func getTitleLabel() {
        let title = Resources.String.Alert.title
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
        let categoriesArray = [" IOS ", "Android", "Design", "Flutter", " QA ",  " PM ", " MVP ", "Frontend", "Fullstack", "Backend"]
        delegate?.presentСategories(category: categoriesArray)
    }

    func didTapSendButton() {
        let title = Resources.String.Alert.title
        let message = Resources.String.Alert.message
        let cancelTitle = Resources.String.Alert.cancel
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        alertController.addAction(cancelAction)
        delegate?.present(alertController, animated: true)
    }
}

