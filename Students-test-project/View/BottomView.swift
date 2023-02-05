//
//  BottomView.swift
//  Students-test-project
//
//  Created by Алексей on 04.02.2023.
//

import UIKit

protocol BottomViewDelegate: AnyObject {
    func dosomthing()
}

final class BottomView: UIView {

    //MARK: - let \ var
    private let textLabel = UILabel()
    private let sendButton = UIButton()

    weak var delegate: BottomViewDelegate?

    //MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BottomView {

    //MARK: - flow funcs
    func addViews() {
        addSubview(textLabel)
        addSubview(sendButton)
    }

    func layoutViews() {
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 60),

            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 20),
            textLabel.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -.l),
        ])
    }

    func configure() {

        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.rounded(radius: .xl)
        sendButton.backgroundColor = .darkGray
        sendButton.setTitle(Resources.String.BottomView.sendButton, for: .normal)
        sendButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: .m)
        sendButton.addTarget(self, action: #selector(tuchDetected), for: .touchUpInside)

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = Resources.String.BottomView.label
        textLabel.font = UIFont(name: "SFProDisplay-Regular", size: .splus)
        textLabel.textColor = .gray
    }

    @objc func tuchDetected() {
        delegate?.dosomthing()
        print(#function)
    }
}
