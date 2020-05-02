import UIKit

class ExpanRowCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID                  = "ExpanRowCell"
    private let titleLabel              = GNTitleLabel(fontSize: 20)
    private var collectionView          : UICollectionView!
    private var albums                  = [Album]()
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTitleLabel()
        configureCollectionView()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ExpanRowCell {
    
    func setup(albums: [Album]) {
        self.albums = albums
        self.collectionView.reloadData()
    }
    
    
    private func configureTitleLabel() {
        
        titleLabel.text = Titles.albums
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    private func configureCollectionView() {
        
        collectionView                                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor                  = .systemBackground
        collectionView.showsHorizontalScrollIndicator   = false
        collectionView.dataSource                       = self
        collectionView.delegate                         = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseID)

        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.scrollDirection          = .horizontal
        flowLayout.sectionInset             = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.minimumInteritemSpacing  = 15
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension ExpanRowCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return albums.count }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
        cell.setup(album: albums[indexPath.item])
        return cell
    }
}


// MARK: - Collection View Delegate
extension ExpanRowCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}


// MARK: - FlowLayout Delegate
extension ExpanRowCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { return CGSize(width: 180, height: 212) }
}
