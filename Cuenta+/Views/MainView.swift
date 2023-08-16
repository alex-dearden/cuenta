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
    
    @StateObject var videoManager = VideoManager()
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(showNewVideo: $showNewVideo)
                        
            NavigationView {
                List {
                    ForEach(videoStorage.videos) { video in
                        NavigationLink(destination: DetailView(video: video)) {
                            ItemRow(item: video)
                        }
                        .frame(width: 300)
                    }
                }
            }.environmentObject(videoManager)
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
