import UIKit

class ExploreRowCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "RowCell"
    private let titleLabel = GNTitleLabel(fontSize: 22)
    private var recentlyPlayedSongs = [Song]()
    private var recommendedForYouSongs = [Song]()
    private var genres = [Genre]()
    private var albums = [Album]()
    private var artists = [Artist]()
    private var cellType: RowCellType!
    private var collectionView: UICollectionView!
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        fetchData()
        configureCollectionView()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension ExploreRowCell {
    
    func setup(cellType: RowCellType) {
        self.cellType = cellType
        titleLabel.text = cellType.rawValue
    }
    
    
    private func fetchData() {
        recentlyPlayedSongs = Song.fetchSongs()
        recommendedForYouSongs = Song.fetchRecommendedForYouSongs()
        albums = Album.fetchAlbums()
        artists = Artist.fetchAllArtists()
        genres = Genre.fetchGenres()
    }
    
    
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(collectionView)

        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: 22))
        collectionView.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 0))
    }
    
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SongCell.self, forCellWithReuseIdentifier: SongCell.reuseID)
        collectionView.register(LargeSongCell.self, forCellWithReuseIdentifier: LargeSongCell.reuseID)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseID)
        collectionView.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.reuseID)
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing = 12.7
        return flowLayout
    }
    
    
    func showModal(with songs: [Song], index: Int) {
        let controller = MusicPlayerVC(songs: songs, index: index)
        controller.modalPresentationStyle = .overCurrentContext
        self.window?.rootViewController?.present(controller, animated: true, completion: nil)
    }
    
    
    func navigateTo(viewCotroller: UIViewController) {
        viewCotroller.modalPresentationStyle = .overCurrentContext
        self.window?.rootViewController?.present(viewCotroller, animated: true, completion: nil)
    }
}


// MARK: - Collection View Data Source
extension ExploreRowCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch cellType {
        case .recentlyPlayed:
            return recentlyPlayedSongs.count
        case .recommendedForYou:
            return recommendedForYouSongs.count
        case .getInspired:
            return albums.count
        case .popularArtists:
            return artists.count
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
            cell.setup(item: recentlyPlayedSongs[indexPath.item], cellType: .recentlyPlayed)
            return cell
        case .recommendedForYou:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeSongCell.reuseID, for: indexPath) as! LargeSongCell
            cell.setup(song: recommendedForYouSongs[indexPath.item])
            return cell
        case .getInspired:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseID, for: indexPath) as! AlbumCell
            cell.setup(album: albums[indexPath.item])
            return cell
        case .popularArtists:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
            cell.setup(item: artists[indexPath.item], cellType: .popularArtists)
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
extension ExploreRowCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch cellType {
        case .recentlyPlayed:
            showModal(with: recentlyPlayedSongs, index: indexPath.item)
        case .popularArtists:
            let controller = ExpanVC(artist: artists[indexPath.item])
            navigateTo(viewCotroller: controller)
        default: break
        }
    }
}


// MARK: - FlowLayout Delegate
extension ExploreRowCell: UICollectionViewDelegateFlowLayout {
    
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
