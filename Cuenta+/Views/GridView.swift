//
//  GridView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct GridView: View {
    let items: [InterestModel]
    @Binding var selectedItems: [InterestModel]
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
            ForEach(items, id: \.self) { item in
                SelectableItemView(buttonText: item.interest.prettyPrint)
            }
        }
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(items: Defaults.allInterests, selectedItems: .constant([]))
    }
}