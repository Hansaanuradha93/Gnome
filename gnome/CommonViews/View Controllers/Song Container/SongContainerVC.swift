import UIKit

class SongContainerVC: UIViewController {

    private let viewModel           = SongContainerVM()
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let songTitleLabel      = GNTitleLabel(fontSize: 20, alignment: .center)
    private let artistLabel         = GNSecondaryTitleLabel(fontSize: 17, alignment: .center)
    private let albumTitleLabel     = GNSecondaryTitleLabel(fontSize: 17, alignment: .center, fontColor: UIColor.appColor(.Pretty_Pink))
    
    private var songs: [Song]!
    private var index: Int!
    private var playerContainerVC: PlayerContainerVC!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(songs: [Song], index: Int,controller: PlayerContainerVC) {
        self.init()
        
        self.songs              = songs
        self.index              = index
        self.playerContainerVC  = controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAlbumTitleLabel()
        configureThumbnailImageView()
        configureSongTitleLabel()
        configureArtistLabel()
        configurePlayerContainerVC()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
        setupUI(with: songs[index])
    }
}


// MARK: - Methods
extension SongContainerVC {
    
    private func configurePlayerContainerVC() { playerContainerVC.playerContainerDelegate = self }
    
    
    private func setupUI(with song: Song?) {
        
        guard let song              = song else { return }
        albumTitleLabel.text        = song.album
        thumbnailImageView.image    = UIImage(named: song.thumbnailUrl)
        songTitleLabel.text         = song.title
        artistLabel.text            = song.artist
    }
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureAlbumTitleLabel() {
        
        view.addSubview(albumTitleLabel)
        
        NSLayoutConstraint.activate([
            albumTitleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            albumTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func configureThumbnailImageView() {
        
        let padding: CGFloat    = 29
        view.addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: padding),
            thumbnailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thumbnailImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            thumbnailImageView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    
    private func configureSongTitleLabel() {
        
        view.addSubview(songTitleLabel)
        
        NSLayoutConstraint.activate([
            songTitleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 30),
            songTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func configureArtistLabel() {
        
        view.addSubview(artistLabel)
        artistLabel.alpha   = 0.6
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 3),
            artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


// MARK: - PlayerContainerDelegate
extension SongContainerVC: PlayerContainerDelegate {
    
    func buttonPressed(index: Int) { print("Next Songs index: \(index)") }
}
