import UIKit

class ExploreCategoryCell: UICollectionViewCell {

    //MARK: - Properties
    static let reuseId = "ExploreCategoryCell"
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
