//
//  Reusable.swift
//  Students-test-project
//
//  Created by Алексей on 08.02.2023.
//

import UIKit

protocol Reusable {
    static var identfier: String { get }
}

extension Reusable {
    static var identfier: String {
        String(describing: Self.self)
    }
}

//extension ViewController: Reusable {
//
//}
//
//extension ListButtonCollectionViewCell: Reusable {
//
//}
