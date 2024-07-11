//
//  SelectableItemView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 30/08/2023.
//

import SwiftUI

struct SelectableItemView: View {
    let item: any Item // TODO: Can we make this generic?
    @State var isSelected: Bool = false
    var handler: (any Item) -> Void
    
    var body: some View {
        Button {
            isSelected.toggle()
            handler(item)
        } label: {
            LabelItemView(itemName: item.name, isSelected: $isSelected)
        }
        .buttonStyle(SelectableButtonStyle())
    }
}

struct LabelItemView: View {
    let itemName: String
    @Binding var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                Text(itemName).minimumScaleFactor(0.8)
            }
        } else {
            HStack {
                Image(systemName: "circle")
                Text(itemName).minimumScaleFactor(0.8)
            }
        }
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
