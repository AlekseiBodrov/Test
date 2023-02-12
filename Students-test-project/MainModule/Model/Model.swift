//
//  Model.swift
//  Students-test-project
//
//  Created by Алексей on 09.02.2023.
//

import Foundation

enum Categorys: CaseIterable {
    case ios
    case android
    case design
    case php
    case flutter
    case qae
    case python
    case frontend
    case fullstack
    case backend

    var lacolizedTitle: String {
        switch self {
        case .ios: return "IOS"
        case .android: return "Android"
        case .design: return "Design"
        case .php: return "PHP"
        case .flutter: return "Flutter"
        case .qae: return "QA"
        case .python: return "Python"
        case .frontend: return "Frontend"
        case .fullstack: return "Fullstack"
        case .backend: return "Backend"
        }
    }
}

struct Category {
    let name: String
    var isSelected: Bool
}
