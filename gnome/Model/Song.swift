import UIKit

struct Song {
    
    let title: String
    let artist: String
    let thumbnailUrl: String
    let numberOfPlays: Int
    let thumbnailImage: UIImage?
    
    
    static func fetchSongs() -> [Song] {
        
        return [
            Song(title: "Bass Rani", artist: "Nucleya", thumbnailUrl: "", numberOfPlays: 500000, thumbnailImage: Temporary.song1),
            Song(title: "Gully Boy", artist: "Various Artists", thumbnailUrl: "", numberOfPlays: 600000, thumbnailImage: Temporary.song2),
            Song(title: "X", artist: "Ed Sheeran", thumbnailUrl: "", numberOfPlays: 800000, thumbnailImage: Temporary.song3),
            Song(title: "Shape Of You", artist: "Ed Sheeran", thumbnailUrl: "", numberOfPlays: 1000000, thumbnailImage: Temporary.song4),
            Song(title: "Kohinoor", artist: "DIVINE", thumbnailUrl: "", numberOfPlays: 100000, thumbnailImage: Temporary.song5),
            Song(title: "Lights", artist: "Nuclea", thumbnailUrl: "", numberOfPlays: 300000, thumbnailImage: Temporary.song6),
        ]
    }
    
    
    static func fetchRecommendedForYouSongs() -> [Song] {
        
        return [
            Song(title: "Kohinoor", artist: "DIVINE", thumbnailUrl: "", numberOfPlays: 100000, thumbnailImage: Temporary.largeSong1),
            Song(title: "Bass Rani", artist: "Nucleya", thumbnailUrl: "", numberOfPlays: 500000, thumbnailImage: Temporary.largeSong2),
            Song(title: "X", artist: "Ed Sheeran", thumbnailUrl: "", numberOfPlays: 800000, thumbnailImage: Temporary.largeSong3),
            Song(title: "Lights", artist: "Nuclea", thumbnailUrl: "", numberOfPlays: 300000, thumbnailImage: Temporary.largeSong1),
            Song(title: "Gully Boy", artist: "Various Artists", thumbnailUrl: "", numberOfPlays: 600000, thumbnailImage: Temporary.largeSong4),
            Song(title: "Shape Of You", artist: "Ed Sheeran", thumbnailUrl: "", numberOfPlays: 1000000, thumbnailImage: Temporary.largeSong2),
        ]
    }
}
