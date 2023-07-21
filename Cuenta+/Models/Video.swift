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
    
    ///: I could have the enum conform to String and make these changes above in its initialisation
    /// but this way gives a more declarative approach and keeps the enum more flexible for future optimisation
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
    
    ///: We will probably need the image at some point outside of a Label element
    func iconImage() -> Image {
        return Image(systemName: iconName())
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
