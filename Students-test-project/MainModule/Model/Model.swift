//
//  Model.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import Foundation

enum Categorys: String, CaseIterable {
    case IOS
    case Android
    case Design
    case QA
    case Flutter
    case PM
    case MVP
    case Frontend
    case Fullstack
    case Backend
}

struct Category {
    let name: String
    var isSelected: Bool
}
