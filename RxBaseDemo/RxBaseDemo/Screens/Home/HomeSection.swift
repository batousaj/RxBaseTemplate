//
//  HomeSection.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 06/12/2023.
//

import Foundation
import RxDataSources

/// Cell
enum HomeCell {
    case headerCell
}

extension HomeCell: IdentifiableType {
    var identity: String {
        switch self {
        case .headerCell:
            return "headerCell"
        }
    }
}

extension HomeCell: Equatable {
    static func == (lhs: HomeCell, rhs: HomeCell) -> Bool {
        switch (lhs, rhs) {
        case (.headerCell, .headerCell):
            return true
        default:
            return false
        }
    }
}

/// Section
enum HomeSection {
    case header(items: [HomeCell])
}

extension HomeSection: AnimatableSectionModelType {
    var identity: String {
        switch self {
        case .header:
            return "header"
        }
    }

    var items: [HomeCell] {
        switch self {
        case .header(let items):
            return items
        }
    }

    init(original: HomeSection, items: [HomeCell]) {
        switch original {
        case .header:
            self = .header(items: items)
        }
    }
}
