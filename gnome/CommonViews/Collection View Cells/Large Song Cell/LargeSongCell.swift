import UIKit

class LargeSongCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "LargeSongCell"
    
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let titleLabel = GNSecondaryTitleLabel(fontSize: 17, alignment: .left)
    private let artistLabel = GNBodyLabel(fontSize: 13)
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension LargeSongCell {
    
    func setup(song: Song) {
        thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
        titleLabel.text = song.title
        artistLabel.text = song.artist
    }
    
    
    private func configureUI() {
        addSubviews(thumbnailImageView, titleLabel, artistLabel)
        
        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: self.frame.width))
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 24))
        artistLabel.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 1, left: 0, bottom: 0, right: 0))
    }
}
