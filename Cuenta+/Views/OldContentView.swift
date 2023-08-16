//
//  ContentView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 21/07/2023.
//

import SwiftUI

struct OldContentView: View {
    var body: some View {
        Label("Favorite Books", systemImage: "books.vertical")
            .labelStyle(.titleAndIcon)
            .font(.title)
    }
}


///: You can also create a customized label style by modifying an existing style; this example adds a red border to the default label style:
struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}
///: This is applied by like this: .labelStyle(RedBorderedLabelStyle())

///: For more extensive customization or to create a completely new label style, you’ll need to adopt the LabelStyle protocol and implement a LabelStyleConfiguration for the new style.

struct OldContentView_Previews: PreviewProvider {
    static var previews: some View {
        OldContentView()
    }
}
