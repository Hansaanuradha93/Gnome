import UIKit

class SongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "SongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let titleLabel          = GNSecondaryTitleLabel(fontSize: 15, alignment: .left)
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") } 
}


// MARK: - Methods
extension SongCell {
    
    func setup<T>(item: T, cellType: RowCellType) {
        
        switch cellType {
            
        case .recentlyPlayed:
            guard let song              = item as? Song else { return }
            thumbnailImageView.image    = UIImage(named: song.thumbnailUrl)
            titleLabel.text             = song.title
        case .popularArtists:
            guard let artist            = item as? Artist else { return }
            thumbnailImageView.image    = UIImage(named: artist.thumbnailUrl)
            titleLabel.text             = artist.name
        default:
            break
        }
    }
    
    
    private func configure() {
        
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 4.7),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
