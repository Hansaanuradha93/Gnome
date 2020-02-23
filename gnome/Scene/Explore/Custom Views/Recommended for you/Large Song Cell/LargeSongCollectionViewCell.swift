import UIKit

class LargeSongCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

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
