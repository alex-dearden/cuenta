//
//  GridView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct GridView: View {
    let items: [String]
    @Binding var selectedItems: [Interest]
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
            ForEach(items, id: \.self) { item in
                SelectableItemView(buttonText: item)
            }
        }
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(items: Interest.allCases.map { $0.prettyPrint }, selectedItems: .constant([]))
    }
}
