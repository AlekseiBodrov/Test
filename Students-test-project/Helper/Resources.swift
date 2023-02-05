//
//  Resources.swift
//  Students-test-project
//
//  Created by Алексей on 04.02.2023.
//

import UIKit

enum Resources {

    enum Images {
        static let background = UIImage(named: "mountains")
    }

    enum String {

        enum Label {
            static let titleLabel = "Стажировка в Surf"
            static let firstDescription = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
            static let secondDescription = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        }

        enum BottomView {
            static let sendButton = "Отправить заявку"
            static let label = "Хочешь к нам?"
        }

        enum Alert {
            static let title = "Поздравляем!"
            static let message = "Ваша заявка успешно отправлена!"
            static let cancel = "Закрыть"
        }
    }

    enum Fonts {
        static func sfProDisplayBold(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Bold", size: size) ?? UIFont()
        }
        static func sfProDisplayRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont()
        }
        static func sfProDisplayMedium(with size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Medium", size: size) ?? UIFont()
        }
    }
}
