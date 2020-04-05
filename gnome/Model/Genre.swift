import Foundation

struct Genre {
    let title: String
    
    static func fetchGenres() -> [Genre] {
        
        return [
            Genre(title: "Pop"),
            Genre(title: "Hip-Hop"),
            Genre(title: "Jazz"),
            Genre(title: "Electronic"),
            Genre(title: "Folk")
        ]
    }
}
