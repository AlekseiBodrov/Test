//
//  MainViewController.swift
//  Students-test-project
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

final class MainViewController: UIViewController {

    //MARK: - constant
    private enum Constant {
        static let cornerRadius: CGFloat = 32.0
        static let sendButtonCornerRadius: CGFloat = 30
        static let bottomLabelFont = Resources.Fonts.sfProDisplayRegular(with: .splus)
        static let sendButtonFont = Resources.Fonts.sfProDisplayMedium(with: .m)
        static let sendButtonHeight: CGFloat = 60
        static let bottomLabelHeight: CGFloat = .mplus
        static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        static var safeAriaHeight: CGFloat = UIViewController().view.safeAreaLayoutGuide.layoutFrame.height
        static let bottomPadding: CGFloat = 50
        static let mainViewTopPadding: CGFloat = 135
        static let padding: CGFloat = .mplus
    }

    //MARK: - property
    private let scrollView = UIScrollView()
    private let baseView = UIView()
    private let backgroundImageView = UIImageView()
    private let mainView = MainView()
    private let bottomLabel = UILabel()
    private let sendButton = UIButton()

    private var leading_ImgView: NSLayoutConstraint?
    private var trailling_ImgView: NSLayoutConstraint?
    private var top_imgView: NSLayoutConstraint?
    private var height_ImgView: NSLayoutConstraint?

    private var presenter = MainPresenter()

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupScrollView()

        Constant.safeAriaHeight = view.safeAreaLayoutGuide.layoutFrame.height + view.safeAreaInsets.bottom
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstraints()
        mainView.setConstraints()
        mainView.headerView.setConstraints()
        mainView.descriptionView1.setConstraints()
        mainView.descriptionView2.setConstraints()
    }
    //MARK: - flow funcs
    private func configure() {
        addSubViews()

        setConstraints()
        mainView.setConstraints()
        mainView.headerView.setConstraints()
        mainView.descriptionView1.setConstraints()
        mainView.descriptionView2.setConstraints()

        configureBaseView()
        configureBackgroundImageView()
        configureMainView()
        configureBottomLabel()
        configureSendButton()

        presenter.setViewDelegate(delegate: self)
        presenter.getBackgroundImage()
        presenter.getTitleLabel()
        presenter.getСategories()

        presenter.delegate = self
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

//            backgroundImageView.topAnchor.constraint(equalTo: baseView.topAnchor),
//            backgroundImageView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
//            backgroundImageView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
//            backgroundImageView.widthAnchor.constraint(equalToConstant: Constant.screenWidth),

            mainView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -Constant.mainViewTopPadding),
            mainView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            mainView.heightAnchor.constraint(equalToConstant: Constant.safeAriaHeight),
        ])

        leading_ImgView = backgroundImageView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor)
        trailling_ImgView = backgroundImageView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor)
        top_imgView = backgroundImageView.topAnchor.constraint(equalTo: baseView.topAnchor)
        height_ImgView = backgroundImageView.widthAnchor.constraint(equalToConstant: Constant.screenWidth)

        leading_ImgView?.isActive = true
        trailling_ImgView?.isActive = true
        top_imgView?.isActive = true
        height_ImgView?.isActive = true

        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.bottomPadding),
            sendButton.heightAnchor.constraint(equalToConstant: Constant.sendButtonHeight),

            bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
            bottomLabel.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: Constant.bottomLabelHeight),
            bottomLabel.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -Constant.padding),
        ])
    }

    private func addSubViews() {
        view.addSubview(scrollView)
        view.addSubview(bottomLabel)
        view.addSubview(sendButton)
        scrollView.addSubview(baseView)
        baseView.addSubview(backgroundImageView)
        baseView.addSubview(mainView)

        view.backgroundColor = Color.mainColor
    }

    private func setupScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.create(backgroundColor: Color.mainColor)
    }

    private func configureBaseView() {
        baseView.create(backgroundColor: Color.mainColor)
    }

    private func configureBackgroundImageView() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.tag = 1
        backgroundImageView.create(backgroundColor: .clear)
    }

    private func configureMainView() {
        presentTitleLabel(title: Resources.String.Label.titleLabel)
        presentFirstDescription(text: Resources.String.Label.firstDescription)
        presentSecondDescription(text: Resources.String.Label.secondDescription)

        mainView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureBottomLabel() {
        bottomLabel.text = Resources.String.BottomView.label
        bottomLabel.font = Constant.bottomLabelFont
        bottomLabel.textColor = Color.secondaryTextColor
        bottomLabel.create(backgroundColor: .clear)
    }

    private func configureSendButton() {
        sendButton.setTitle(Resources.String.BottomView.sendButton, for: .normal)
        sendButton.titleLabel?.font = Constant.sendButtonFont
        sendButton.addTarget(self, action: #selector(tuchDetected), for: .touchUpInside)
        sendButton.rounded(radius: Constant.sendButtonCornerRadius)
        sendButton.create(backgroundColor: Color.secondaryColor)
    }

    @objc func tuchDetected() {
        presentAlert()
    }
}

    //MARK: - PresenterDelegate
extension MainViewController: PresenterDelegate {
    func presentBackgroundImage(with name: String) {
        backgroundImageView.image = UIImage(named: name)
    }

    func presentBackgroundImage(image: UIImage) {

    }

    func presentTitleLabel(title: String) {
        mainView.headerView.setupTitle(with: title)
    }

    func presentFirstDescription(text: String) {
        mainView.descriptionView1.setupTitle(with: text)
    }

    func presentSecondDescription(text: String) {
        mainView.descriptionView2.setupTitle(with: text)
    }

    func presentСategories(category: [Category]) {
        mainView.collectionView1.categoriesArray = category
        mainView.collectionView2.categoriesArray = category
    }

    func presentAlert() {
        let title = Resources.String.Alert.title
        let message = Resources.String.Alert.message
        let cancelTitle = Resources.String.Alert.cancel
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
