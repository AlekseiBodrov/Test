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
        static let height: CGFloat = UIScreen.main.bounds.size.height
        static var heightSafeAria: CGFloat = UIViewController().view.safeAreaLayoutGuide.layoutFrame.height
        static let width: CGFloat = UIScreen.main.bounds.size.width
        static let backgroundImageViewHeight: CGFloat = 800
        static let padding: CGFloat = 20
        static let bottomPadding: CGFloat = 50
    }

    //MARK: - property
    private let scrollView = UIScrollView()
    private let baseView = UIView()
    private let backgroundImageView = UIImageView()
    private let mainView = MainView()
    private let bottomLabel = UILabel()
    private let sendButton = UIButton()

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

        Constant.heightSafeAria = view.safeAreaLayoutGuide.layoutFrame.height
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

            backgroundImageView.topAnchor.constraint(equalTo: baseView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: Constant.width),

            mainView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -135),
            mainView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor),
            mainView.heightAnchor.constraint(equalToConstant: Constant.heightSafeAria),
        ])

        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.bottomPadding),
            sendButton.heightAnchor.constraint(equalToConstant: 60),

            bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
            bottomLabel.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
            bottomLabel.heightAnchor.constraint(equalToConstant: 20),
            bottomLabel.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -.l),
        ])
    }

    private func addSubViews() {
        view.backgroundColor = Color.mainColor

        view.addSubview(scrollView)
        view.addSubview(bottomLabel)
        view.addSubview(sendButton)
        scrollView.addSubview(baseView)
        baseView.addSubview(backgroundImageView)
        baseView.addSubview(mainView)
    }

    private func setupScrollView() {
        scrollView.backgroundColor = Color.mainColor
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureBaseView() {
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.backgroundColor = Color.mainColor
    }

    private func configureBackgroundImageView() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.tag = 1
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureMainView() {
        presentTitleLabel(title: Resources.String.Label.titleLabel)
        presentFirstDescription(text: Resources.String.Label.firstDescription)
        presentSecondDescription(text: Resources.String.Label.secondDescription)

        mainView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureBottomLabel() {
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = Resources.String.BottomView.label
        bottomLabel.font = Resources.Fonts.sfProDisplayRegular(with: .splus)
        bottomLabel.textColor = Color.secondaryTextColor
    }

    private func configureSendButton() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.rounded(radius: 30)
        sendButton.backgroundColor = Color.secondaryColor
        sendButton.setTitle(Resources.String.BottomView.sendButton, for: .normal)
        sendButton.titleLabel?.font = Resources.Fonts.sfProDisplayMedium(with: .m)
        sendButton.addTarget(self, action: #selector(tuchDetected), for: .touchUpInside)
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
        print(scrollView.contentOffset.y)

        if scrollView.contentOffset.y < 0.0 {

          }

//        if scrollView.contentOffset.y < 0.0 {
//            backgroundImageView.constraints
//            self.backgroundImageView.constant = 250 - (scrollView.contentOffset.y)
//            self.top_imgView.constant = scrollView.contentOffset.y
//            self.trailling_ImgView.constant = (scrollView.contentOffset.y)
//            self.leading_ImgView.constant =  (scrollView.contentOffset.y)
//        }
//        else {
//            if scrollView.contentOffset.y < 70 {
//            self.height_ImgView.constant = 250 - (scrollView.contentOffset.y)
//            self.top_imgView.constant =  (scrollView.contentOffset.y * 0.25)
//            self.bottom_ImgView.constant = -(scrollView.contentOffset.y * 0.75)
//            self.trailling_ImgView.constant =  -(scrollView.contentOffset.y)
//            self.leading_ImgView.constant =  -(scrollView.contentOffset.y)
//            }
//        }
    }
}
