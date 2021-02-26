//
//  Job.swift
//  SearchViewControllerTutorial
//
//  Created by Drink Sirichai on 13/2/2564 BE.
//

import Foundation

enum Job: CaseIterable {
    case teacher
    case developer
    case engineer
    case other

    var title: String {
        switch self {
        case .teacher:
            return "Teacher"
        case .developer:
            return "Developer"
        case .engineer:
            return "Engineer"
        case .other:
            return "Other"
        }
    }
}
