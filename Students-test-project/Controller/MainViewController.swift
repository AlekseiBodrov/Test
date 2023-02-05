//
//  MainViewController.swift
//  Students-test-project
//
//  Created by Алексей on 03.02.2023.
//

 import UIKit

 final class MainViewController: UIViewController {

     //MARK: - let/var
     private enum Constant {
         static let padding: CGFloat = 20
         static let paddingBottom: CGFloat = 50
     }

     private var scrollView: UIScrollView =  .init()

//     private let bottomContainer = BottomView()
     private let textLabel = UILabel()
     private let sendButton = UIButton()

     private let backgroundImage = BackgroundView()
     private let titleLabel = TitleView()

     private let firstСategory = CategoriesView()
     private let secondСategory = CategoriesView()

     private let firstDescription = DescriptionView()
     private let secondDescription = DescriptionView()

     private let presenter = MainPresenter()

     //MARK: - life cycle funcs
     override func viewDidLoad() {
         super.viewDidLoad()
         configure()
         setConstraints()
     }

     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         setupScrollView()
     }

     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         scrollView.frame = view.bounds
     }
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         presenter.didTapSendButton()
     }

     //MARK: - flow funcs
     private func configure() {

         view.addSubview(scrollView)
//         view.addSubview(bottomContainer)
         view.addSubview(textLabel)
         view.addSubview(sendButton)

         scrollView.backgroundColor = .white

         presenter.setViewDelegate(delegate: self)
         presenter.getBackgroundImage()
         presenter.getTitleLabel()
         presenter.getСategories()



         sendButton.translatesAutoresizingMaskIntoConstraints = false // BottomView()
         sendButton.rounded(radius: 30) // BottomView()
         sendButton.backgroundColor = .darkGray // BottomView()
         sendButton.setTitle(Resources.String.BottomView.sendButton, for: .normal) // BottomView()
         sendButton.titleLabel?.font = Resources.Fonts.sfProDisplayMedium(with: .m) // BottomView()
         sendButton.addTarget(self, action: #selector(tuchDetected), for: .touchUpInside) // BottomView()

         textLabel.translatesAutoresizingMaskIntoConstraints = false // BottomView()
         textLabel.text = Resources.String.BottomView.label // BottomView()
         textLabel.font = Resources.Fonts.sfProDisplayRegular(with: .splus) // BottomView()
         textLabel.textColor = .gray
     }

     @objc func tuchDetected() { // BottomView()
         presentAlert() // BottomView()
     } // BottomView()


     private func setupScrollView() {

         var y: CGFloat = 0

         y += setupBackgroundImage(coordinateY: y)
         y += setupTitleLabel(coordinateY: y)
         y += setupDescription(with: Resources.String.Label.firstDescription, coordinateY: y, description: firstDescription)
         y += setupCategoriesView(coordinateY: y)
         y += setupDescription(with: Resources.String.Label.secondDescription, coordinateY: y, description: secondDescription)
         y += setupCategoriesView1(coordinateY: y)
         y += 500

         scrollView.contentSize = .init(width: scrollView.bounds.width, height: y)
         scrollView.showsVerticalScrollIndicator = false
     }

     private func setConstraints() {
         scrollView.translatesAutoresizingMaskIntoConstraints = false
//         bottomContainer.translatesAutoresizingMaskIntoConstraints = false
         textLabel.translatesAutoresizingMaskIntoConstraints = false
         sendButton.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         ])

//         NSLayoutConstraint.activate([
//            bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
//            bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
//            bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.paddingBottom),
//         ])
         NSLayoutConstraint.activate([
             sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
             sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.paddingBottom),
             sendButton.heightAnchor.constraint(equalToConstant: 60),

             textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
             textLabel.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
             textLabel.heightAnchor.constraint(equalToConstant: 20),
             textLabel.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -.l),
         ])
     }

     private func setupBackgroundImage(coordinateY y: CGFloat) -> CGFloat {
         let screenSize = UIScreen.main.bounds
         backgroundImage.contentMode = .scaleAspectFill
         backgroundImage.frame = .init(x: 0, y: 0, width: scrollView.bounds.width, height: screenSize.height * 0.8)
         scrollView.addSubview(backgroundImage)
         return screenSize.height * 0.6
     }

     private func setupTitleLabel(coordinateY y: CGFloat) -> CGFloat {
         let height: CGFloat = 56
         titleLabel.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
         titleLabel.setup(with: Resources.String.Label.titleLabel)
         titleLabel.rounded(radius: 32)
         titleLabel.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
         titleLabel.clipsToBounds = true
         scrollView.addSubview(titleLabel)
         return height
     }

     private func setupDescription(with text: String, coordinateY y: CGFloat, description: DescriptionView) -> CGFloat {
         let height: CGFloat = 70
         description.backgroundColor = .white
         description.setup(with: text)
         description.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
         scrollView.addSubview(description)
         return height
     }

     private func setupCategoriesView(coordinateY y: CGFloat) -> CGFloat {
         let height: CGFloat = 70
         firstСategory.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
         scrollView.addSubview(firstСategory)
         return height
     }

     private func setupCategoriesView1(coordinateY y: CGFloat) -> CGFloat {
         let height: CGFloat = 100
         secondСategory.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
         scrollView.addSubview(secondСategory)
         return height
     }
 }

extension MainViewController: MainPresenterDelegate {

    func presentBackgroundImage(image: UIImage) {
        backgroundImage.setupImage(image)
    }

    func presentTitleLabel(title: String) {

    }

    func presentFirstDescription(text: String) {

    }

    func presentSecondDescription(text: String) {

    }

    func presentСategories(category: [String]) {
        firstСategory.categoriesArray = category
        secondСategory.categoriesArray = category
    }

    func presentAlert() {
        presenter.didTapSendButton()
    }
}






































































/*
 //
 //  ViewController.swift
 //  Students-test-project
 //
 //  Created by Алексей on 03.02.2023.
 //

  import UIKit

  final class ViewController: UIViewController {

      //MARK: - let/var
      private enum Constant {
          static let padding: CGFloat = 20
          static let paddingBottom: CGFloat = 50
      }

      private var scrollView: UIScrollView =  .init()
      private let bottomContainer = BottomView()

      private let backgroundImage = BackgroundView()
      private let titleLabel = TitleView()

      private let firstСategory = CategoriesView()
      private let secondСategory = CategoriesView()

      private let firstDescription = DescriptionView()
      private let secondDescription = DescriptionView()

      var presenter: MainPresenter?

      //MARK: - life cycle funcs
      override func viewDidLoad() {
          super.viewDidLoad()
          configure()
          setConstraints()
      }

      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          setupScrollView()


      }

      override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          scrollView.frame = view.bounds

      }

      //MARK: - flow funcs
      private func configure() {

          presenter = Presenter(view: self)

          view.addSubview(scrollView)
          view.addSubview(bottomContainer)

          bottomContainer.delegate = self
          scrollView.delegate = self
          scrollView.backgroundColor = .white
      }


      private func setupScrollView() {

          var y: CGFloat = 0

          y += setupBackgroundImage(coordinateY: y)
          y += setupTitleLabel(coordinateY: y)
          y += setupDescription(with: Resources.String.Label.firstDescription, coordinateY: y, description: firstDescription)
          y += setupCategoriesView(coordinateY: y)
          y += setupDescription(with: Resources.String.Label.secondDescription, coordinateY: y, description: secondDescription)
          y += setupCategoriesView1(coordinateY: y)
          y += 500

          scrollView.contentSize = .init(width: scrollView.bounds.width, height: y)
          scrollView.showsVerticalScrollIndicator = false
      }

      private func setConstraints() {
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          bottomContainer.translatesAutoresizingMaskIntoConstraints = false

          NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          ])

          NSLayoutConstraint.activate([
             bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
             bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
             bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.paddingBottom),
          ])
      }

      private func setupBackgroundImage(coordinateY y: CGFloat) -> CGFloat {
          let screenSize = UIScreen.main.bounds
          guard let image = Resources.Images.background else { return 0 }
          backgroundImage.setupImage(image)
          backgroundImage.contentMode = .scaleAspectFill
          backgroundImage.frame = .init(x: 0, y: 0, width: scrollView.bounds.width, height: screenSize.height * 0.8)
          scrollView.addSubview(backgroundImage)
          return screenSize.height * 0.6
      }

      private func setupTitleLabel(coordinateY y: CGFloat) -> CGFloat {
          let height: CGFloat = 56
          titleLabel.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
          titleLabel.setup(with: Resources.String.Label.titleLabel)
          titleLabel.rounded(radius: 32)
          titleLabel.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
          titleLabel.clipsToBounds = true
          scrollView.addSubview(titleLabel)
          return height
      }

      private func setupDescription(with text: String, coordinateY y: CGFloat, description: DescriptionView) -> CGFloat {
          let height: CGFloat = 70
          description.backgroundColor = .white
          description.setup(with: text)
          description.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
          scrollView.addSubview(description)
          return height
      }

      private func setupCategoriesView(coordinateY y: CGFloat) -> CGFloat {
          let height: CGFloat = 70
          firstСategory.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
          scrollView.addSubview(firstСategory)
          return height
      }

      private func setupCategoriesView1(coordinateY y: CGFloat) -> CGFloat {
          let height: CGFloat = 100
          secondСategory.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
          scrollView.addSubview(secondСategory)
          return height
      }

      private func showAlert() {

          let title = Resources.String.Alert.title
          let message = Resources.String.Alert.message
          let cancelTitle = Resources.String.Alert.cancel

          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
          alertController.addAction(cancelAction)
          present(alertController, animated: true)
      }
  }

  extension ViewController: BottomViewDelegate {
      func didTapSendButton() {
          showAlert()
      }
  }

  extension ViewController: UIScrollViewDelegate {

  }

 extension ViewController: PresenterView {
     func display(newData: String?) {

     }
 }

 */
