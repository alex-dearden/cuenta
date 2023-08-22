//
//  ContentView.swift
//  Cuenta+
//
//  Created by Alex Dearden on 17/07/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var videoStorage: VideoStorage
    @State private var showNewVideo = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                HeaderView(showNewVideo: $showNewVideo)
                
                List {
                    ForEach(videoStorage.items) { video in
                        NavigationLink(destination: DetailView(video: video)) {
                            ItemRow(item: video)
                        }
                        .frame(width: 300)
                    }
                }
            }
            .padding()
            .controlSize(.large)
            .sheet(isPresented: $showNewVideo) { AddView(isPresented: $showNewVideo) }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
                .environmentObject(VideoStorage(items: VideoStorage.mockVideos))
        }
    }
}

struct IconView: View {
    let icon: Image
    
    var body: some View {
        icon
    }
}
