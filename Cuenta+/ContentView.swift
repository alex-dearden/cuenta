//
//  ContentView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 17/07/2023.
//

import SwiftUI

struct MainView: View {
    @State var videos: [Video] = []
    
    var body: some View {
        LazyVStack(spacing: 20) {
            Button(action: {
                videos.append(Video(name: "new one", icon: .lizard))
            }, label: {
                Text("Tap to create new Video")
            }
            )
            
            ForEach(videos) { video in
                HStack {
                    Text(video.name)
                    video.iconImage()
                }
            }
            .frame(width: 300)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(videos: Video.mock)
    }
}
