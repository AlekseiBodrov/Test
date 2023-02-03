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
        static let heightForRow: CGFloat = 500
        static let heightForHeaderInSection: CGFloat = 500
    }

    private let tableView = UITableView()
    private let headerTableView = BackgroundView()
    private let viewForHeaderInSection = CategoriesView()

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
        tableView.backgroundColor = .lightGray
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
        view.backgroundColor = .lightGray
        view.addSubview(tableView)

    }

    private func setConstraints() {

    }
}

//MARK: - extension Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.heightForRow
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

