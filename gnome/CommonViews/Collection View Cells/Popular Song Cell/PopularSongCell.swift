import UIKit

class PopularSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "PopularSongCell"
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
