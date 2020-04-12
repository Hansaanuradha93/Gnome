import UIKit

class SongContainerVC: UIViewController {

    private let viewModel           = SongContainerVM()
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let songTitleLabel      = GNTitleLabel(fontSize: 20, alignment: .center)
    private let artistLabel         = GNSecondaryTitleLabel(fontSize: 17, alignment: .center)
    private let albumTitleLabel     = GNSecondaryTitleLabel(fontSize: 17, alignment: .center, fontColor: UIColor.appColor(.Pretty_Pink))
    
    var song: Song!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(song: Song) {
        
        self.init()
        self.song = song
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAlbumTitleLabel()
        configureThumbnailImageView()
        configureSongTitleLabel()
        configureArtistLabel()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
        setupUI(with: song)
    }
}


// MARK: - Methods
extension SongContainerVC {
    
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
        let dimension: CGFloat  = 317
        view.addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: padding),
            thumbnailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: dimension),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: dimension)
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
