//
//  GridItemView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

import SwiftUI

struct GridItemView: View {
    let item: String
    
    init(_ item: String) {
        self.item = item
    }
    
    var body: some View {
        Text(item)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(CuentaColor.orange.swiftColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView("Mental Health")
    }
}
