//
//  Interests.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

enum Category: String, CaseIterable {
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
