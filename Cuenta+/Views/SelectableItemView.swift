//
//  SelectableItemView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 30/08/2023.
//

import SwiftUI

struct SelectableItemView: View {
    let buttonText: String
    @State var isSelected: Bool = false
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            if isSelected {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text(buttonText)
                }
            } else {
                Text(buttonText)
            }
        }
        .buttonStyle(SelectableButtonStyle())
    }
}

struct SelectableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(CuentaColor.orange.swiftColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SelectableItemView_Previews: PreviewProvider {
    static var previews: some View {
        SelectableItemView(buttonText: "Mental Health")
    }
}