//
//  CuentaColor.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

enum CuentaColor {
    case orange
    case violet
    
    var swiftColor: Color {
        switch self {
        case .orange:
            return Color(red: 253/255, green: 98/255, blue: 73/255)
        case .violet:            
            return Color(hue: 238/360, saturation: 0.7, brightness: 1)
        }
    }
}
