//
//  ContentView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 17/07/2023.
//

import SwiftUI

struct MainView: View {
    @State var videos: [Video] = []
    @State private var showDetail = false
    
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
            Button("Present sheet") {
                showDetail.toggle()
            }
        }
        .sheet(isPresented: $showDetail) {
            DetailView(isPresented: $showDetail)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(videos: Video.mock)
    }
}

struct DetailView: View {
    @Binding var isPresented: Bool
//    @Binding var video: Video
    
    var body: some View {
        Button("Dismiss") {
            isPresented = false
        }
        VStack {
            Text("Some detail")
        }
    }
}
