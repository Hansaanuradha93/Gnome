import Foundation

struct Artist {
    
    let name: String
    
    static func fetchAllArtists() -> [Artist] {
        
        return [
            Artist(name: "DIVINE"),
            Artist(name: "DJ Snake"),
            Artist(name: "RITVIZ"),
            Artist(name: "Nucleya"),
            Artist(name: "Ed Sheeran"),
            Artist(name: "Kavya Trehan"),
        ]
    }
}
