//
//  CircleView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct CircleView: View {
    let number: Int
    
    var body: some View {
        Text("\(number)")
            .padding()
            .foregroundColor(.white)
            .background(CuentaColor.orange.swiftColor)
            .clipShape(Circle())
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(number: 1)
    }
}
