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
                SelectableItemView(
                    item: item,
                    handler: { item in
                        // TODO: this should be done by the item or user manager!
                        if let interestItem = item as? InterestModel {
                            if selectedItems.contains(interestItem) {
                                selectedItems.removeAll(where: { $0 == interestItem })
                                debugPrint("item REMOVED from selectedItems: \(selectedItems.map { $0.name })")
                            } else {
                                selectedItems.append(interestItem)
                                debugPrint("item ADDED to selectedItems: \(selectedItems.map { $0.name }))")
                            }
                        }
                    }
                )
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
