import UIKit

class TopTrendingCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "TopTrendingCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureThumbnailImageView()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    // MARK: - Methods
    private func configureThumbnailImageView() {
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor)
        ])
    }
}
