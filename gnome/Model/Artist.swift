import Foundation

struct Artist {
    
    let name: String
    let thumbnailUrl: String
    
    
    static func fetchAllArtists() -> [Artist] {
        
        return [
            Artist(name: "DIVINE", thumbnailUrl: Temporary.artist1),
            Artist(name: "DJ Snake", thumbnailUrl: Temporary.artist2),
            Artist(name: "RITVIZ", thumbnailUrl: Temporary.artist3),
            Artist(name: "Nucleya", thumbnailUrl: Temporary.artist4),
            Artist(name: "Ed Sheeran", thumbnailUrl: Temporary.artist5),
            Artist(name: "Kavya Trehan", thumbnailUrl: Temporary.artist2),
        ]
    }
}
