//
//  StepView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct StepView: View {
    let number: Int
    let message: String
    
    var body: some View {
        HStack {
            CircleView(number: number)
            Text(message)
        }
        .padding(.horizontal)
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(number: 1, message: "Create and account")
    }
}
