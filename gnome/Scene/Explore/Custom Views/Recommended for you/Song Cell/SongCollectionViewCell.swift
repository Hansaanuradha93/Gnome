import UIKit

class SongCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    // MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


// MARK: - Methods
extension SongCollectionViewCell {
    
    func setup(cellType: CellType) {
        switch cellType {
        case .recentlyPlayed:
            configureCell( title: "061 Marketing...", textAlignment: .center, artist: "", alpha: 0)
        case .recommendecForYou:
            configureCell( title: "Love", textAlignment: .left, artist: "", alpha: 0)
        case .getInspired:
            configureCell( title: "The GaryVee Audio Experience", textAlignment: .center, artist: "", alpha: 1)
        case .popularArtists:
            configureCell( title: "Ariana Grande", textAlignment: .left, artist: "", alpha: 0)
        }
    }
    
    private func configureCell( title: String, textAlignment: NSTextAlignment, artist: String, alpha: CGFloat) {
        artistLabel.alpha = alpha
        artistLabel.text = artist
        titleLabel.text = title
        titleLabel.textAlignment = textAlignment
    }
    
}
