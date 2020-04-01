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
}


// MARK: - Methods
extension RowCell {
    
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
        collectionView.dataSource       = self
        collectionView.delegate         = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SongCell.self, forCellWithReuseIdentifier: SongCell.reuseID)
        addSubview(collectionView)
        
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


// MARK: - Collection View Data Source
extension RowCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
        return cell
    }
}


// MARK: - Collection View Delegate
extension RowCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selected")
    }
}


// MARK: - FlowLayout Delegate
extension RowCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        return CGSize(width: height, height: height)
    }
}


