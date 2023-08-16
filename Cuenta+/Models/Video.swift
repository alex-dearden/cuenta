import SwiftUI

struct Video: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: IconImage
    let author: String
    
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

#if DEBUG
extension Video {
    static var mockVideo: Video {
        return self.init(name: "Como encontrar paz", icon: .videoImage, author: "Mariana Branger")
    }
}
#endif
