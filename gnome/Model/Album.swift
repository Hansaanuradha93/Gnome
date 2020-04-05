import Foundation

struct Album {
    
    let title: String
    let artist: String
    let thumbnailUrl: String
    
    
    static func fetchAlbums() -> [Album] {
        
        return [
            Album(title: "Raja Baja", artist: "Kavya Trehan", thumbnailUrl: ""),
            Album(title: "The GaryVee Audio Experience", artist: "Gerry Flinch", thumbnailUrl: ""),
            Album(title: "Wireframe", artist: "MKHD", thumbnailUrl: ""),
            Album(title: "Design Better Podcast", artist: "Sean Allen", thumbnailUrl: ""),
            Album(title: "Kohinoor", artist: "Divine", thumbnailUrl: "")
        ]
    }
}
