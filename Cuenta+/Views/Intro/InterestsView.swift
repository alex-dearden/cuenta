//
//  Interests.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct InterestsView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
            
            StepView(number: 2, message: "Choose your interests")
            
            Form {
                Section("Interests") {                    
                    GridView(items: Defaults.allInterestsSorted)
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
