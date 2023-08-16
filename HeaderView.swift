//
//  HeaderView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 16/08/2023.
//

import SwiftUI

struct HeaderView: View {
    ///: This needs to be a `@Binding` because we have to change its value
    /// yet the data doesn't belong to this view, it belongs to the calling view
    /// we could also make it an `@Environment` variable so that this HeaderView can be called from anywhere
    /// and we don't have to send the bound value
    @Binding var showNewVideo: Bool
    
    var body: some View {
        HStack(spacing: 50) {
            Button(action: {
                showNewVideo.toggle()
            }, label: {
                Label("Add video", systemImage: "doc.fill.badge.plus")
                    .foregroundColor(.purple)
            })
            
            Spacer()

        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showNewVideo: .constant(true))
    }
}
