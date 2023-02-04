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

     private var scrollView: UIScrollView = .init()
     private let bottomContainer = BottomView()

     private let backgroundImage = BackgroundView()
     private let category = CategoriesView()
     private let titleLabel = TitleView()

     private let firstDescription = DescriptionView()
     private let secondDescription = DescriptionView()

     //MARK: - life cycle funcs
     override func viewDidLoad() {
         super.viewDidLoad()
         view.addSubview(scrollView)
         view.addSubview(bottomContainer)



         bottomContainer.delegate = self
         scrollView.delegate = self

         setConstraints()
     }

     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         setupScrollView()
     }

     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         scrollView.frame = view.bounds
         scrollView.backgroundColor = .red
     }

     private func setupScrollView() {
         var y: CGFloat = 0

         y += setupBackgroundImage(coordinateY: y)
         y += setupTitleLabel(coordinateY: y)
         y += setupDescription(with: Resources.String.Label.firstDescription, coordinateY: y, description: firstDescription)
         y += setupCategoriesView(coordinateY: y)
         y += setupDescription(with: Resources.String.Label.secondDescription, coordinateY: y, description: secondDescription)
//         y += setupCategoriesView(coordinateY: y)

         scrollView.contentSize = .init(width: scrollView.bounds.width, height: y)
         scrollView.showsVerticalScrollIndicator = false
     }

     private func setConstraints() {
         scrollView.translatesAutoresizingMaskIntoConstraints = false

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
         let height: CGFloat = 140
         description.backgroundColor = .white
         description.setup(with: text)
         description.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: 140)
         scrollView.addSubview(description)
         return height
     }

     private func setupCategoriesView(coordinateY y: CGFloat) -> CGFloat {
         let height: CGFloat = 240
         scrollView.addSubview(category)
         category.frame = .init(x: 0, y: y, width: scrollView.bounds.width, height: height)
         return height
     }
 }

 extension ViewController: BottomViewDelegate {
     func dosomthing() {
         print("dasdasdas")
     }
 }

 extension ViewController: UIScrollViewDelegate {

 }


























    /*

     //MARK: - let/var
     private enum Constant {
 //        static let rowHeight: CGFloat = 210
         static let heightForHeaderInSection: CGFloat = 210
         static let padding: CGFloat = 20
         static let paddingBottom: CGFloat = 50
     }

     private var scrollView: UIScrollView = .init()

     private let headerTableView = BackgroundView()
     private let viewForHeaderInSection = CategoriesView()
     private let bottomContainer = BottomView()


     //MARK: - life cycle funcs
     override func viewDidLoad() {
         super.viewDidLoad()
         configure()
     }

     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         setupScrollView()
     }

     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         // расположить на весь экран
         scrollView.frame = view.bounds
     }

     // Контент в scrollView укладывается следующим образом
     private func setupScrollView() {


         // Итоговый размер scrollView в частности у сумма всех height
 //        scrollView.contentSize = .init(width: scrollView.bounds.width, height: y)
         scrollView.addSubview(headerTableView)
         scrollView.addSubview(viewForHeaderInSection)

         scrollView.showsVerticalScrollIndicator = false
     }
 }

 extension ViewController {

     //MARK: - flow funcs
     private func configure() {
         view.addSubview(scrollView)
     }
 }
     */

//
////MARK: - extension Delegate, DataSource
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        20
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return self.viewForHeaderInSection
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return Constant.heightForHeaderInSection
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell else { return UITableViewCell() }
////                as? Description Cell else { return UITableViewCell() }
//        cell.configure(with: "Получай стипендию, выстраивай удобный график, работай на современном железе.")
//        return cell
//    }
//}
//extension ViewController: BottomViewDelegate {
//    func dosomthing() {
//        print("dasdasdas")
//    }
//}



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
         static let rowHeight: CGFloat = 210
         static let heightForHeaderInSection: CGFloat = 210
         static let padding: CGFloat = 20
         static let paddingBottom: CGFloat = 50
     }

     private let tableView = UITableView()
     private let headerTableView = BackgroundView()
     private let viewForHeaderInSection = CategoriesView()

     private let bottomContainer = UIView()


     //MARK: - life cycle funcs
     override func viewDidLoad() {
         super.viewDidLoad()
         configure()
         setConstraints()
     }
 }

 extension ViewController {

     //MARK: - flow funcs
     private func configure() {
         tableView.backgroundColor = .white
         tableView.frame = view.bounds
         headerTableView.frame = .init(x: 0, y: 0, width: tableView.bounds.width, height: 400)

         tableView.delegate = self
         tableView.dataSource = self
         let nib  = UINib(nibName: "MainTableViewCell", bundle: nil)
         tableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
         tableView.showsVerticalScrollIndicator = false
         tableView.separatorColor = .lightGray
         viewForHeaderInSection.rounded(radius: 16)
         viewForHeaderInSection.clipsToBounds = true
         tableView.tableHeaderView = headerTableView

         tableView.backgroundColor = .lightGray

         bottomButton.rounded(radius: 30)
         bottomButton.backgroundColor = .darkGray
         bottomButton.setTitle("Отправить заявку", for: .normal)
         bottomButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)

         bottomLabel.text = "Хочешь к нам?"
         bottomLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
         bottomLabel.textColor = .gray

         view.backgroundColor = .lightGray
         view.addSubview(tableView)

         view.addSubview(bottomContainer)
         bottomContainer.addSubview(bottomButton)
         bottomContainer.addSubview(bottomLabel)

     }



     private func setConstraints() {
         bottomContainer.translatesAutoresizingMaskIntoConstraints = false
         bottomButton.translatesAutoresizingMaskIntoConstraints = false
         bottomLabel.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([

             bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.padding),
             bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.padding),
             bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.paddingBottom),
             bottomContainer.heightAnchor.constraint(equalTo: bottomButton.heightAnchor),

             bottomButton.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor),
             bottomButton.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor),
             bottomButton.heightAnchor.constraint(equalToConstant: 60),

             bottomLabel.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor),
             bottomLabel.centerYAnchor.constraint(equalTo: bottomButton.centerYAnchor),
             bottomLabel.heightAnchor.constraint(equalToConstant: 20),
             bottomLabel.trailingAnchor.constraint(equalTo: bottomButton.leadingAnchor, constant: -24),

         ])
     }
 }

 //MARK: - extension Delegate, DataSource
 extension ViewController: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
     }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return Constant.rowHeight
     }

     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         return self.viewForHeaderInSection
     }

     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return Constant.heightForHeaderInSection
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return UITableViewCell()
     }
 }


 */
