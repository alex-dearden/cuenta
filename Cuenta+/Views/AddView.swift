//
//  AddView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 21/07/2023.
//

import SwiftUI

struct AddView: View {
    @Binding var isPresented: Bool
    
    @EnvironmentObject var manager: VideoManager
    
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
            
            Button(action: {
                // TODO: Create save button functionality
                print("calling videoManager.pop")
                manager.pop()
                isPresented = false
            }, label: {
                Text("Save")
                    .foregroundColor(.white)
                    .padding(5)
            })
            .background(.blue)
            .cornerRadius(5)
            
            Spacer()
            
        }.padding()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isPresented: .constant(true))
    }
}
