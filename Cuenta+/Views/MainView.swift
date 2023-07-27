//
//  ContentView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 17/07/2023.
//

import SwiftUI

struct MainView: View {
//    @Binding var videos: [Video]
    @ObservedObject var videoStorage: VideoStorage
    @State private var showNewVideo = false
    
    var body: some View {
        LazyVStack(spacing: 20) {
            HStack(spacing: 50) {
                Button(action: {
                    showNewVideo.toggle()
                }, label: {
                    Label("Add video", systemImage: "doc.fill.badge.plus")
                        .foregroundColor(.purple)
                })
                
                Spacer()
                
                Button(action: {
//                    showNewVideo.toggle()
                }, label: {
                    Label("Details", systemImage: "display")
                        
                })
            }.padding(.bottom, 40)
            
            ForEach($videoStorage.videos) { $video in
                HStack {
                    Label(video.name, systemImage: video.icon.name)
                }
            }
            .frame(width: 300)
            
        }
        .padding()
        .controlSize(.large)
        .sheet(isPresented: $showNewVideo) {
            AddView(isPresented: $showNewVideo)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView(videoStorage: VideoStorage(videos: Video.mockVideos))
    }
}

struct IconView: View {
    let icon: Image
    
    var body: some View {
        icon
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

