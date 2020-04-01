import UIKit

class LargeSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID = "LargeSongCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
    }
}
