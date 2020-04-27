import UIKit

class ArtistSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "ArtistSongCell"
    private let titleLabel          = GNTitleLabel(fontSize: 20)
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTitleLabel()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ArtistSongCell {
    
    private func configureTitleLabel() {
        
        titleLabel.text = Titles.popular
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
