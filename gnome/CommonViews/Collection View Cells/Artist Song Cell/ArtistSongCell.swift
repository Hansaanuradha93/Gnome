import UIKit

class ArtistSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "ArtistSongCell"
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ArtistSongCell {
    
}
