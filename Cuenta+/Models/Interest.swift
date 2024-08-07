//
//  Interests.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import Foundation

protocol Item: Hashable {
    var id: UUID { get set }
    var name: String { get set }
}

struct InterestModel: Hashable, Equatable, Item {
    var id = UUID()
    var name: String
}

/// # This is just a helper, delete when we get them from the web API
private enum Interest: String, CaseIterable {
    case technology, science, design, health, mentalHealth, communication, politics
    
    var prettyPrint: String {
        switch self {
        case .mentalHealth:
            return "Mental Health"
        default:
            return self.rawValue.capitalized
        }
    }
}

extension Interest: Comparable {
    static func < (lhs: Interest, rhs: Interest) -> Bool {
        return lhs == rhs
    }
}

extension InterestModel: Comparable {
    static func < (lhs: InterestModel, rhs: InterestModel) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Defaults {
    static let allInterests: [InterestModel] = Interest.allCases.map { InterestModel(name: $0.prettyPrint) }
    static var allInterestsSorted: [InterestModel] {
        let sortedString = Interest.allCases.map { $0.prettyPrint }.sorted { $0 < $1 }
        let interestsSorted: [InterestModel] = sortedString.map { InterestModel(name: $0) }
        return interestsSorted
    }
}
