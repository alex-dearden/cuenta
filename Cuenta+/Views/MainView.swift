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
            HStack(spacing: 50) {
                Button(action: {
                    videos.append(Video(name: "new one", icon: .lizard))
                }, label: {
                    Label("Add video", systemImage: "doc.fill.badge.plus")
                        .foregroundColor(.purple)
                })
                
                Spacer()
                
                Button(action: {
                    showDetail.toggle()
                }, label: {
                    Label("Details", systemImage: "display")
                        
                })
            }.padding(.bottom, 40)
            
            ForEach(videos) { video in
                HStack {
                    Label(video.name, systemImage: video.icon.name)
                }
            }
            .frame(width: 300)
            
        }
        .padding()
        .controlSize(.large)
        .sheet(isPresented: $showDetail) {
            DetailView(isPresented: $showDetail)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(videos: Video.mockVideos)
    }
}

struct IconView: View {
    let icon: Image
    
    var body: some View {
        icon
    }
}

struct AddView: View {
    @State private var name: String = ""
    @State private var icon: Video.IconImage = .videoImage
    
    var body: some View {
        HStack {
            TextField("Name", text: $name)
            Picker("Icon", selection: $icon, content: {
//                ForEach(Video.IconImage.allCases) { icon in
//                    IconView(icon: icon)
//                }
            })
        }
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

