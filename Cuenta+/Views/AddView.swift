//
//  AddView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 21/07/2023.
//

import SwiftUI

struct AddView: View {
    @Binding var isPresented: Bool
    
    @EnvironmentObject var storage: VideoStorage
    
    @State private var name: String = ""
    @State private var icon: Video.IconImage = .videoImage
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 50) {
            HStack {
                Button(action: {
                    isPresented = false
                }, label: {
                    Image(systemName: "clear")
                        .foregroundColor(.red)
                })
            }
            
            HStack {
                TextField("Name", text: $name)
                Picker("Icon", selection: $icon, content: {
                    ForEach(Video.IconImage.allCases) { icon in
                        Text(icon.name)
                            .tag(icon)
                    }
                })
            }
            
            Button("Save") {
                let newItem = Video(name: name, icon: icon, author: "")
                storage.add(item: newItem)
                isPresented = false
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }.padding()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isPresented: .constant(true))
    }
}
