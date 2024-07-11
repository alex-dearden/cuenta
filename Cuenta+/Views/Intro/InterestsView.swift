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
