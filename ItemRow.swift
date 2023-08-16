//
//  ItemRow.swift
//  Cuenta+
//
//  Created by Alex Dearden on 16/08/2023.
//

import SwiftUI

struct ItemRow: View {
    let item: Video
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                item.iconImage()
                    .padding(8)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.orange, lineWidth: 1))
                
                Text(item.name)
                    .font(.headline)
            }
            
            Text(item.author)
                .font(.subheadline)
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Video.mockVideo)
    }
}
