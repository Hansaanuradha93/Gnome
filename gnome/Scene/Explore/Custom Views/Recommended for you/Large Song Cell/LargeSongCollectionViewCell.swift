import UIKit

class LargeSongCollectionViewCell: UICollectionViewCell {

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
extension LargeSongCollectionViewCell {
    
    func setup(cellType: CellType) {
        switch cellType {
        case .recommendecForYou:
            artistLabel.alpha = 1
            titleLabel.textAlignment = .left
        case .getInspired:
            artistLabel.alpha = 0
            titleLabel.text = "The GaryVee Audio Experience"
            titleLabel.textAlignment = .center
        case .recentlyPlayed:
            artistLabel.alpha = 1
        }
    }
    
}
