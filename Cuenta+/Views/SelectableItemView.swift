//
//  SelectableItemView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 30/08/2023.
//

import SwiftUI

struct SelectableItemView: View {
    let item: InterestModel
    @State var isSelected: Bool = false
    var handler: (InterestModel) -> Void
    
    var body: some View {
        Button {
            isSelected.toggle()
            handler(item)
        } label: {
            if isSelected {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text(item.interest.prettyPrint)
                }
            } else {
                Text(item.interest.prettyPrint)
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
        SelectableItemView(item: Defaults.allInterests.first!, handler: { _ in })
    }
}
