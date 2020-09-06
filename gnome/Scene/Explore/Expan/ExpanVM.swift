import Foundation

class ExpanVM {
    
    enum SectionType: Int {
        case thumbnail = 0
        case popularSongs = 1
        case albums = 2
    }
    
    
    struct Section {
        var sectionType: SectionType
        var index: Int
    }
    
    
    lazy var sections: [Section] = {
        var data = [Section]()
        
        let thumbnailSection = Section(sectionType: .thumbnail, index: 0)
        let popularSongsSection = Section(sectionType: .popularSongs, index: 1)
        let albumsSection = Section(sectionType: .albums, index: 2)

        data.append(thumbnailSection)
        data.append(popularSongsSection)
        data.append(albumsSection)
        
        return data
    }()
}
