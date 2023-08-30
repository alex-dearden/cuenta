//
//  Interests.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import Foundation

enum Interest: String, CaseIterable {
    case technology, science, design, health, mentalHealth, communication, politics
    
    var prettyPrint: String {
        switch self {
        case .mentalHealth:
            return "Mental Health"
        default:
            return self.rawValue.capitalized
        }
    }
    
//    #if DEBUG
//    static let mock
//    #endif
}

struct InterestModel: Hashable, Equatable {
    let id = UUID()
    let interest: Interest
}

struct Defaults {
    static let allInterests = Interest.allCases.map { InterestModel(interest: $0) }    
}
