import UIKit

struct Song {
    
    let title: String
    let artistname: String
    let thumbnailUrl: String
    let numberOfPlays: Int
    let thumbnailImage: UIImage?
    
    static func fetchSongs() -> [Song] {
        
        return [
            Song(title: "Bass Rani", artistname: "Nucleya", thumbnailUrl: "", numberOfPlays: 500000, thumbnailImage: Temporary.song1),
            Song(title: "Gully Boy", artistname: "Various Artists", thumbnailUrl: "", numberOfPlays: 600000, thumbnailImage: Temporary.song2),
            Song(title: "X", artistname: "Ed Sheeran", thumbnailUrl: "", numberOfPlays: 800000, thumbnailImage: Temporary.song3),
            Song(title: "Shape Of You", artistname: "Ed Sheeran", thumbnailUrl: "", numberOfPlays: 1000000, thumbnailImage: Temporary.song4),
            Song(title: "Kohinoor", artistname: "DIVINE", thumbnailUrl: "", numberOfPlays: 100000, thumbnailImage: Temporary.song5),
            Song(title: "Lights", artistname: "Nuclea", thumbnailUrl: "", numberOfPlays: 300000, thumbnailImage: Temporary.song6),
        ]
    }
}
