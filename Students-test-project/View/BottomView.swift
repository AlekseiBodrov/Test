//
//  BottomView.swift
//  Students-test-project
//
//  Created by Алексей on 04.02.2023.
//

import UIKit

protocol BottomViewDelegate: AnyObject {
    func didTapSendButton()
}

final class BottomView: UIView {

    //MARK: - let \ var
    private let textLabel = UILabel()
    private let sendButton = UIButton()

    weak var delegate: BottomViewDelegate?

    //MARK: - life cycle funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        layoutView()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BottomView {

    //MARK: - flow funcs
    func addView() {
        addSubview(textLabel)
        addSubview(sendButton)
    }

    func layoutView() {
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
        sendButton.rounded(radius: 30)
        sendButton.backgroundColor = .darkGray
        sendButton.setTitle(Resources.String.BottomView.sendButton, for: .normal)
        sendButton.titleLabel?.font = Resources.Fonts.sfProDisplayMedium(with: .m)
        sendButton.addTarget(self, action: #selector(tuchDetected), for: .touchUpInside)

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = Resources.String.BottomView.label
        textLabel.font = Resources.Fonts.sfProDisplayRegular(with: .splus)
        textLabel.textColor = .gray
    }

    @objc func tuchDetected() {
        delegate?.didTapSendButton()
        print(#function)
    }
}
