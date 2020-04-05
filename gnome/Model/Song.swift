import Foundation

struct Song {
    
    let title: String
    let artist: String
    let thumbnailUrl: String
    let numberOfPlays: Int
    
    
    static func fetchSongs() -> [Song] {
        
        return [
            Song(title: "Bass Rani", artist: "Nucleya", thumbnailUrl: Temporary.song1, numberOfPlays: 500000),
            Song(title: "Gully Boy", artist: "Various Artists", thumbnailUrl: Temporary.song2, numberOfPlays: 600000),
            Song(title: "X", artist: "Ed Sheeran", thumbnailUrl: Temporary.song3, numberOfPlays: 800000),
            Song(title: "Shape Of You", artist: "Ed Sheeran", thumbnailUrl: Temporary.song4, numberOfPlays: 1000000),
            Song(title: "Kohinoor", artist: "DIVINE", thumbnailUrl: Temporary.song5, numberOfPlays: 100000),
            Song(title: "Lights", artist: "Nuclea", thumbnailUrl: Temporary.song6, numberOfPlays: 300000),
        ]
    }
    
    
    static func fetchRecommendedForYouSongs() -> [Song] {
        
        return [
            Song(title: "Kohinoor", artist: "DIVINE", thumbnailUrl: Temporary.largeSong1, numberOfPlays: 100000),
            Song(title: "Bass Rani", artist: "Nucleya", thumbnailUrl: Temporary.largeSong2, numberOfPlays: 500000),
            Song(title: "X", artist: "Ed Sheeran", thumbnailUrl: Temporary.largeSong3, numberOfPlays: 800000),
            Song(title: "Lights", artist: "Nuclea", thumbnailUrl: Temporary.largeSong4, numberOfPlays: 300000),
            Song(title: "Gully Boy", artist: "Various Artists", thumbnailUrl: Temporary.largeSong1, numberOfPlays: 600000),
            Song(title: "Shape Of You", artist: "Ed Sheeran", thumbnailUrl: Temporary.largeSong3, numberOfPlays: 1000000),
        ]
    }
}
