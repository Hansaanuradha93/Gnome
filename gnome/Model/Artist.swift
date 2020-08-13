import Foundation

struct Artist {
    let name: String
    let thumbnailUrl: String
    let largeThumbnailUrl: String
    
    static func fetchAllArtists() -> [Artist] {
        return [
            Artist(name: "DIVINE", thumbnailUrl: Temporary.artist1, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "DJ Snake", thumbnailUrl: Temporary.artist2, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "RITVIZ", thumbnailUrl: Temporary.artist3, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "Nucleya", thumbnailUrl: Temporary.artist4, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "Ed Sheeran", thumbnailUrl: Temporary.artist5, largeThumbnailUrl: Temporary.artistLarge1),
            Artist(name: "Kavya Trehan", thumbnailUrl: Temporary.artist2, largeThumbnailUrl: Temporary.artistLarge1),
        ]
    }
}
