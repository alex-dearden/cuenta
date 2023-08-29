//
//  Header.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        Button {
            // TODO: Save preferences and navigate to next view
        } label: {
            Text("Next")
                .font(.title)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(CuentaColor.orange.swiftColor)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
