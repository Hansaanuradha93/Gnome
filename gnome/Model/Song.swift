import Foundation

struct Song {
    
    let title: String
    let artist: String
    let thumbnailUrl: String
    let numberOfPlays: Int
    let album: String
    let file: File
    
    
    static func fetchSongs() -> [Song] {
        
        return [
            Song(title: "Bass Rani", artist: "Nucleya", thumbnailUrl: Temporary.song1, numberOfPlays: 500000, album: "Raja Baja",file: File(name: "nuclea", type: FileType.mp3.rawValue)),
            Song(title: "Gully Boy", artist: "Various Artists", thumbnailUrl: Temporary.song2, numberOfPlays: 600000, album: "The GaryVee Audio Experience",file: File(name: "gullboy", type: FileType.mp3.rawValue)),
            Song(title: "X", artist: "Ed Sheeran", thumbnailUrl: Temporary.song3, numberOfPlays: 800000, album: "Wireframe",file: File(name: "x", type: FileType.mp3.rawValue)),
            Song(title: "Shape Of You", artist: "Ed Sheeran", thumbnailUrl: Temporary.song4, numberOfPlays: 1000000, album: "Design Better Podcast",file: File(name: "shapeofyou", type: FileType.mp3.rawValue)),
            Song(title: "Kohinoor", artist: "DIVINE", thumbnailUrl: Temporary.song5, numberOfPlays: 100000, album: "Kohinoor",file: File(name: "kohinoor", type: FileType.mp3.rawValue)),
            Song(title: "Lights", artist: "Nuclea", thumbnailUrl: Temporary.song6, numberOfPlays: 300000, album: "Raja Baja",file: File(name: "lights", type: FileType.mp3.rawValue)),
        ]
    }
    
    
    static func fetchRecommendedForYouSongs() -> [Song] {
        
        return [
            Song(title: "Kohinoor", artist: "DIVINE", thumbnailUrl: Temporary.largeSong1, numberOfPlays: 1100000, album: "The GaryVee Audio Experience", file: File(name: "nuclea", type: FileType.mp3.rawValue)),
            Song(title: "Bass Rani", artist: "Nucleya", thumbnailUrl: Temporary.largeSong2, numberOfPlays: 5300000, album: "Wireframe", file: File(name: "nuclea", type: FileType.mp3.rawValue)),
            Song(title: "X", artist: "Ed Sheeran", thumbnailUrl: Temporary.largeSong3, numberOfPlays: 4500000, album: "Raja Baja", file: File(name: "nuclea", type: FileType.mp3.rawValue)),
            Song(title: "Lights", artist: "Nuclea", thumbnailUrl: Temporary.largeSong4, numberOfPlays: 3000000, album: "Design Better Podcast", file: File(name: "nuclea", type: FileType.mp3.rawValue)),
            Song(title: "Gully Boy", artist: "Various Artists", thumbnailUrl: Temporary.largeSong1, numberOfPlays: 5100000, album: "Kohinoor", file: File(name: "nuclea", type: FileType.mp3.rawValue)),
            Song(title: "Shape Of You", artist: "Ed Sheeran", thumbnailUrl: Temporary.largeSong3, numberOfPlays: 1000000, album: "Raja Baja", file: File(name: "nuclea", type: FileType.mp3.rawValue)),
        ]
    }
}
