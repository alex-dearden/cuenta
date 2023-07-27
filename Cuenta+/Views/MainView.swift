//
//  ContentView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 17/07/2023.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var videoStorage: VideoStorage
    @State private var showNewVideo = false
    
    var body: some View {
        LazyVStack(spacing: 20) {
            
            HeaderView(showNewVideo: $showNewVideo)
                        
            NavigationView {
                List {
                    ForEach($videoStorage.videos) { $video in
                        HStack {
                            Label(video.name, systemImage: video.icon.name)
                        }
                    }
                    .frame(width: 300)
                }
            }
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

        }.padding(.bottom, 40)
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
    @Binding var video: Video
    
    var body: some View {
        Button("Dismiss") {
            isPresented = false
        }
        VStack {
            Label(video.name, systemImage: video.icon.rawValue)
        }
    }
}

