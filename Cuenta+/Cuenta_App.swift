//
//  Cuenta_App.swift
//  Cuenta+
//
//  Created by Alex Dearden on 17/07/2023.
//

import SwiftUI

@main
struct Cuenta_App: App {
    @StateObject var storage = VideoStorage(videos: VideoStorage.mockVideos)
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(storage)
        }
    }
}

///: A Tab view app in SwiftUI
//@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
            ///: This is just to make the app compile,
//            ContentView()
//            MainView(videoStorage: VideoStorage(videos: VideoStorage.mockVideos))
//            TabView {
//                ContentView()
//                    .tabItem {
//                        Label("Journal", systemImage: "book")
//                    }
//                SettingsView()
//                    .tabItem {
//                        Label("Settings", systemImage: "gear")
//                    }
//            }
//        }
//    }
//}
