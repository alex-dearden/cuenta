import SwiftUI

struct Video: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: IconImage
    
    enum IconImage: String, CaseIterable, Identifiable {
        case videoImage = "video"
        case regularImage = "camera"
        case lizard = "lizard"
        
        var name: String {
            rawValue.lowercased()
        }
        
        var id: String {
            name
        }
    }
    
    ///: We will probably need the image at some point, outside of a Label element
    func iconImage() -> Image {
        return Image(systemName: icon.name)
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

class Videos: ObservableObject {
    @Published var all: [Video] = []
}
