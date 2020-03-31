import UIKit

class RowCell: UICollectionViewCell {
    
    enum RowCellType: String {
        case recentlyPlayed     = "Recenlty Played"
        case recommendedForYou  = "Recommended For You"
        case getInspired        = "Get Inspired!"
        case popularArtists     = "Polular Artists"
        case genres             = "Genres & Moods"
    }
    
    
    // MARK: - Properties
    static let reuseID          = "RowCell"
    private let titleLabel      = GNTitleLabel(fontSize: 22)
    private let collectionViewContainer = UIView()
    private var collectionView  : UICollectionView!
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(cellType: RowCellType) {
        titleLabel.text         = cellType.rawValue
    }
    
    
    private func configure() {
        addSubview(titleLabel)
        addSubview(collectionViewContainer)
        collectionViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            collectionViewContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            collectionViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
