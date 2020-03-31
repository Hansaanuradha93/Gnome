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
    private var collectionView  : UICollectionView!
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
        configureCollectionView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(cellType: RowCellType) {
        titleLabel.text         = cellType.rawValue
    }
    
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.scrollDirection          = .horizontal
        flowLayout.sectionInset             = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing  = 12.7
        return flowLayout
    }
}
