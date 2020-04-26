import UIKit

class ExpanArtistCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "ExpanArtistCell"
    private let thumbnailImageView  = GNThumbnaiImageView(radius: 0)
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureThumbnailImage()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ExpanArtistCell {
    
    func setup(artist: Artist) {
        thumbnailImageView.image = UIImage(named: artist.largeThumbnailUrl)
    }
    
    private func configureThumbnailImage() {
        
        let aspectRacio: CGFloat = 1148 / 791
            
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: aspectRacio)
        ])
    }
}
