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

struct Defaults {
    static let allInterests = Interest.allCases.map { InterestModel(name: $0.prettyPrint) }
}
