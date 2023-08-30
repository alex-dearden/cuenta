//
//  Interests.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct InterestsView: View {
    @State private var selectedItems: [InterestModel] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
            
            StepView(number: 2, message: "Choose your interests")
            
            Form {
                Section("Interests") {
                    // TODO: These need to be buttons or have an `onTap` modifier attached
                    /// when tapping them, they should change to indicate they've been selected
                    /// they should be able to remove the selection
                    /// we need to keep a local array or selected `Interests`
                    /// then call `.append` on the appropriate manager to add them
                    GridView(items: Defaults.allInterests.map { $0 }, selectedItems: $selectedItems)
                }
            }
            
            FooterView()
        }
    }
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView()
    }
}
