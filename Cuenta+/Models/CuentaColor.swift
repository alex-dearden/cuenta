//
//  CuentaColor.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

enum CuentaColor {
    case orange
    
    var swiftColor: Color {
        switch self {
        case .orange:
            return Color(red: 253/255, green: 98/255, blue: 73/255)
        }
    }
}
