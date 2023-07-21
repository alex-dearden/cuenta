import SwiftUI

struct Video: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: IconImage
    
    enum IconImage {
        case videoImage
        case regularImage
        case lizard
    }
    
    func iconName() -> String {
        switch self.icon {
        case .videoImage:
            return "video"
        case .regularImage:
            return "camera"
        case .lizard:
            return "lizard"
        }
    }
    
    func iconImage() -> Image {
        switch self.icon {
        case .videoImage:
            return Image(systemName: "video")
        case .regularImage:
            return Image(systemName: "camera")
        case .lizard:
            return Image(systemName: "lizard")
        }
    }
}


extension Video {
    static var mockVideos: [Video] {
        return [
            Video(name: "Primero", icon: .videoImage),
            Video(name: "Segundo", icon: .regularImage)
        ]
    }
}
