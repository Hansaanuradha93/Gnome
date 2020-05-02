import UIKit

class ArtistPopularSongsCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID              = "ArtistSongCell"
    private let titleLabel          = GNTitleLabel(fontSize: 20)
    private var collectionView      : UICollectionView!
    private var songs               = [Song]()
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTitleLabel()
        configureCollectionView()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ArtistPopularSongsCell {
    
    func setup(songs: [Song]) {
        self.songs = songs
        self.collectionView.reloadData()
    }
    
    private func configureTitleLabel() {
        
        titleLabel.text = Titles.popular
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        collectionView.dataSource       = self
        collectionView.delegate         = self
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PopularSongCell.self, forCellWithReuseIdentifier: PopularSongCell.reuseID)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.scrollDirection      = .horizontal
        flowLayout.sectionInset         = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.minimumLineSpacing   = 20.7
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension ArtistPopularSongsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return songs.count }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSongCell.reuseID, for: indexPath) as! PopularSongCell
        cell.setup(song: songs[indexPath.item])
        return cell
    }
}


// MARK: - FlowLayout Delegate
extension ArtistPopularSongsCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout          = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width               = UIScreen.main.bounds.size.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        return CGSize(width: width, height: 70.5)
    }
}
