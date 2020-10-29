import UIKit

class AlbumCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "AlbumCell"
    
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let titleLabel = GNSecondaryTitleLabel(fontSize: 17, alignment: .left)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension AlbumCell {
    
    func setup(album: Album) {
        titleLabel.text = album.title
        thumbnailImageView.image = UIImage(named: album.thumbnailUrl)
    }
    
    
    private func configureUI() {
        titleLabel.numberOfLines = 2
        addSubviews(thumbnailImageView, titleLabel)
        
        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: self.frame.width))
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    }
}
