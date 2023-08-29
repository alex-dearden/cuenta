/// This is simply so we can test and mess around
/// in a real app we would NEVER have 2 different models!

import Foundation

struct ExternalVideos: Decodable {
    let videos: [ExternalVideo]
}

struct ExternalVideo: Decodable {
    let id: String
    let name: String
    let author: String
    let icon: String
}

extension ExternalVideo: Equatable {}
