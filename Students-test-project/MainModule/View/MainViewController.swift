//
//  MainViewController.swift
//  Students-test-project
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - constant
    private enum Constant {
        static let cornerRadius: CGFloat = 32.0
        static let sendButtonCornerRadius: CGFloat = 30
        static let bottomLabelFont = Resources.Fonts.sfProDisplayRegular(with: .splusSize)
        static let sendButtonFont = Resources.Fonts.sfProDisplayMedium(with: .mSize)
        static let sendButtonHeight: CGFloat = 60
        static let bottomLabelHeight: CGFloat = .mplusSize
        static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        static let bottomPadding: CGFloat = 50
        static let mainViewTopPadding: CGFloat = 135
        static let padding: CGFloat = .mplusSize
    }

    // MARK: - property
    private let scrollView = UIScrollView()
    private let baseView = UIView()
    private let backgroundImageView = UIImageView()
    private let mainView = MainView()
    private let bottomLabel = UILabel()
    private let sendButton = UIButton()

    private var safeAriaHeight: CGFloat?

    private var presenter = MainPresenter()

    // MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()

        configure()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        safeAriaHeight = view.frame.size.height - view.safeAreaInsets.top
        setConstraints()
    }

    // MARK: - flow funcs
    private func configure() {
        configureView()
        configureImageView()
        configureLabel()
        configureButton()
        configurePresenter()
    }

    private func addSubViews() {
        view.addSubview(scrollView)
        view.addSubview(sendButton)
        view.addSubview(bottomLabel)

        scrollView.addSubview(baseView)
        baseView.addSubview(backgroundImageView)
        baseView.addSubview(mainView)
    }

    private func configureView() {
        view.backgroundColor = Color.mainColor

        baseView.create(backgroundColor: Color.mainColor)
        mainView.create(backgroundColor: .clear)

        scrollView.create(backgroundColor: Color.mainColor)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
    }

    private func configureImageView() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.tag = 1
        backgroundImageView.create(backgroundColor: .clear)
    }

    private func configureLabel() {
        bottomLabel.text = Resources.BottomView.label
        bottomLabel.font = Constant.bottomLabelFont
        bottomLabel.textColor = Color.secondaryTextColor
        bottomLabel.create(backgroundColor: .clear)

        presentTitleLabel(title: Resources.Label.titleLabel)
        presentFirstDescription(text: Resources.Label.firstDescription)
        presentSecondDescription(text: Resources.Label.secondDescription)
    }

    private func configureButton() {
        sendButton.setTitle(Resources.BottomView.sendButton, for: .normal)
        sendButton.titleLabel?.font = Constant.sendButtonFont
        sendButton.setTitleColor(Color.secondaryColor, for: .highlighted)
        sendButton.setTitleColor(Color.lightSecondaryColor, for: .normal)
        sendButton.layer.borderColor = Color.secondaryColor.cgColor
        sendButton.layer.borderWidth = 1
        sendButton.addTarget(self, action: #selector(tuchDownDetected), for: .touchDown)
        sendButton.addTarget(self, action: #selector(tuchUpDetected), for: .touchUpInside)
        sendButton.rounded(radius:
                            Constant.sendButtonCornerRadius)
        sendButton.create(backgroundColor: Color.secondaryColor)
    }

    private func configurePresenter() {

        presenter.setViewDelegate(delegate: self)
        presenter.getBackgroundImage()
        presenter.getTitleLabel()
        presenter.getСategories()

        presenter.delegate = self
    }

    @objc func tuchDownDetected() {
        sendButton.backgroundColor = Color.lightSecondaryColor
    }

    @objc func tuchUpDetected() {
        sendButton.backgroundColor = Color.secondaryColor
        presentAlert()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            baseView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            baseView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            baseView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            backgroundImageView.topAnchor.constraint(equalTo: baseView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: Constant.screenWidth),

            mainView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor,
                                          constant: -Constant.mainViewTopPadding),
            mainView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            mainView.heightAnchor.constraint(equalToConstant:
                                                safeAriaHeight ?? view.frame.height )
        ])

        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.bottomPadding),
            sendButton.heightAnchor.constraint(equalToConstant: Constant.sendButtonHeight),

            bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
            bottomLabel.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: Constant.bottomLabelHeight),
            bottomLabel.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor,
                                                  constant: -Constant.padding)
        ])
    }
}

    // MARK: - PresenterDelegate
extension MainViewController: PresenterDelegate {
    func presentBackgroundImage(with name: String) {
        backgroundImageView.image = UIImage(named: name)
    }

    func presentTitleLabel(title: String) {
        mainView.headerView.setupTitle(with: title)
    }

    func presentFirstDescription(text: String) {
        mainView.firstDescriptionView.setupTitle(with: text)
    }

    func presentSecondDescription(text: String) {
        mainView.secondDescriptionView.setupTitle(with: text)
    }

    func fetchСategories(category: [Category]) {
        mainView.firstCollectionView.categoriesArray = category
        mainView.secondCollectionView.categoriesArray = category
    }

    func presentAlert() {
        let title = Resources.Alert.title
        let message = Resources.Alert.message
        let cancelTitle = Resources.Alert.cancel
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scale: CGFloat = 1 - (scrollView.contentOffset.y * 0.005)
        let translationY: CGFloat = scrollView.contentOffset.y * 0.5

        guard scrollView.contentOffset.y < 0.0 else { return }
        backgroundImageView.transform = CGAffineTransform(scaleX: scale, y: scale).translatedBy(x: 0, y: translationY)
    }
}
