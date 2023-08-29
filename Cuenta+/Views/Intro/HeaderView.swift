//
//  HeaderView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("Cuenta+")
            .foregroundColor(.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(CuentaColor.orange.swiftColor)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
