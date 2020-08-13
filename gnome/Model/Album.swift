import Foundation

struct Album {
    let title: String
    let artist: String
    let thumbnailUrl: String
    
    
    static func fetchAlbums() -> [Album] {
        return [
            Album(title: "Raja Baja", artist: "Kavya Trehan", thumbnailUrl: Temporary.album1),
            Album(title: "The GaryVee Audio Experience", artist: "Gerry Flinch", thumbnailUrl: Temporary.album2),
            Album(title: "Wireframe", artist: "MKHD", thumbnailUrl: Temporary.album3),
            Album(title: "Design Better Podcast", artist: "Sean Allen", thumbnailUrl: Temporary.album4),
            Album(title: "Kohinoor", artist: "Divine", thumbnailUrl: Temporary.album1)
        ]
    }
}
