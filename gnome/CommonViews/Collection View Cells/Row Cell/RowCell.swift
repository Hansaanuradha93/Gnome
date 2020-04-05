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
    static let reuseID                  = "RowCell"
    private let titleLabel              = GNTitleLabel(fontSize: 22)
    private var recentlyPlayedSongs     = [Song]()
    private var recommendedForYouSongs  = [Song]()
    private var genres                  = [Genre]()
    private var cellType                : RowCellType!
    private var collectionView          : UICollectionView!
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fetchSongs()
        fetchRecommendedForYouSongs()
        fetchGenres()
        configureTitleLabel()
        configureCollectionView()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension RowCell {
    
    func setup(cellType: RowCellType) {
        
        self.cellType           = cellType
        titleLabel.text         = cellType.rawValue
    }
    
    
    private func fetchSongs() { recentlyPlayedSongs = Song.fetchSongs() }
    
    
    private func fetchRecommendedForYouSongs() { recommendedForYouSongs = Song.fetchRecommendedForYouSongs() }
    
    
    private func fetchGenres() { genres = Genre.fetchGenres() }
    
    
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
        
        collectionView                                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor                  = .systemBackground
        collectionView.showsHorizontalScrollIndicator   = false
        collectionView.dataSource                       = self
        collectionView.delegate                         = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SongCell.self, forCellWithReuseIdentifier: SongCell.reuseID)
        collectionView.register(LargeSongCell.self, forCellWithReuseIdentifier: LargeSongCell.reuseID)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseID)
        collectionView.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.reuseID)

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
        
        switch cellType {
        case .recentlyPlayed:
            return recentlyPlayedSongs.count
        case .recommendedForYou:
            return recommendedForYouSongs.count
        case .getInspired:
            return 4
        case .popularArtists:
            return 7
        case .genres:
            return genres.count
        case .none:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch cellType {
        case .recentlyPlayed:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
            cell.setup(song: recentlyPlayedSongs[indexPath.item])
            return cell
        case .recommendedForYou:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeSongCell.reuseID, for: indexPath) as! LargeSongCell
            cell.setup(song: recommendedForYouSongs[indexPath.item])
            return cell
        case .getInspired:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
            return cell
        case .popularArtists:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
            return cell
        case .genres:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCell.reuseID, for: indexPath) as! GenresCell
            cell.setup(genre: genres[indexPath.item])
            return cell
        case .none:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
            return cell
        }

    }
}


// MARK: - Collection View Delegate
extension RowCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { print("Item selected") }
}


// MARK: - FlowLayout Delegate
extension RowCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch cellType {
        case .recentlyPlayed:
            return CGSize(width: 114.5, height: 140)
        case .recommendedForYou:
            return CGSize(width: 180, height: 232)
        case .getInspired:
            return CGSize(width: 180, height: 236)
        case .popularArtists:
            return CGSize(width: 114.5, height: 140)
        case .genres:
            return CGSize(width: 148, height: 70)
        case .none:
            return CGSize(width: 0, height: 0)
        }
    }
}


