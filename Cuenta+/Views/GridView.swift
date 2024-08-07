//
//  GridView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct GridView: View {
    let items: [InterestModel]
    @State var selectedItems: [InterestModel] = []
    
    // TODO: We should inject this
    /// For now, this is only testing
    var userManager = UserManager.testUserManager
    
    private let columns = [
        GridItem(.adaptive(minimum: 400))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
            /// # I can't use `any Item` for `items` above because a protocol cannot conform to `Hashable`
            /// I might be able to use `type erasure` but not sure it's worth it
            ForEach(items, id: \.self) { item in
                SelectableItemView(
                    item: item,
                    handler: { item in                        
                        guard let interestItem = item as? InterestModel else { return }
                        userManager.addInterest(interestItem)
                        
                            if selectedItems.contains(interestItem) {
                                selectedItems.removeAll(where: { $0 == interestItem })                                
                            } else {
                                selectedItems.append(interestItem)
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
        GridView(items: Defaults.allInterestsSorted, selectedItems: [])
    }
}
