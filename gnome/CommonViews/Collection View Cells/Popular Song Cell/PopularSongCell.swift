import UIKit

class PopularSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "PopularSongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureThumbnailImageView()
        backgroundColor = .red
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension PopularSongCell {
    
    private func configureThumbnailImageView() {
        
        thumbnailImageView.image = UIImage(named: Temporary.song1)
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            thumbnailImageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
