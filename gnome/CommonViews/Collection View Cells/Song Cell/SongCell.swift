import UIKit

class SongCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "SongCell"
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let titleLabel = GNSecondaryTitleLabel(fontSize: 15, alignment: .left)
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension SongCell {
    
    func setup<T>(item: T, cellType: RowCellType) {
        switch cellType {
        case .recentlyPlayed:
            guard let song = item as? Song else { return }
            thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
            titleLabel.text = song.title
        case .popularArtists:
            guard let artist = item as? Artist else { return }
            thumbnailImageView.image = UIImage(named: artist.thumbnailUrl)
            titleLabel.text = artist.name
        default: break
        }
    }
    
    
    private func configureUI() {
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        
        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: self.frame.width))
        titleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4.7, left: 0, bottom: 0, right: 0))    }
}
