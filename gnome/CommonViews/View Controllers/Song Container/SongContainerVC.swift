import UIKit

class SongContainerVC: UIViewController {

    // MARK: Properties
    private let viewModel = SongContainerVM()
    
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let songTitleLabel = GNTitleLabel(fontSize: 20, alignment: .center)
    private let artistLabel = GNSecondaryTitleLabel(fontSize: 17, alignment: .center)
    private let albumTitleLabel = GNSecondaryTitleLabel(fontSize: 17, alignment: .center, fontColor: UIColor.appColor(.Pretty_Pink))
    
    private var songs: [Song]!
    private var index: Int!
    private var playerContainerVC: PlayerContainerVC!
    
    
    // MARK: Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(songs: [Song], index: Int,controller: PlayerContainerVC) {
        self.init()
        self.songs = songs
        self.index = index
        self.playerContainerVC = controller
    }
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configurePlayerContainerVC()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI(with: songs[index])
    }
}


// MARK: - Fileprivate Methods
fileprivate extension SongContainerVC {
    
    func configurePlayerContainerVC() {
        playerContainerVC.playerContainerDelegate = self
    }
    
    
    func setupUI(with song: Song?) {
        guard let song = song else { return }
        albumTitleLabel.text = song.album
        thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
        songTitleLabel.text = song.title
        artistLabel.text = song.artist
    }
    
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubviews(albumTitleLabel, thumbnailImageView, songTitleLabel, artistLabel)
        
        artistLabel.alpha = 0.6
        let dimensions: CGFloat = view.frame.width - 60
                
        albumTitleLabel.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil)
        albumTitleLabel.centerHorizontallyInSuperView()
        thumbnailImageView.anchor(top: albumTitleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 29, left: 0, bottom: 0, right: 0))
        thumbnailImageView.centerHorizontallyInSuperView(size: .init(width: dimensions, height: dimensions))
        songTitleLabel.anchor(top: thumbnailImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        songTitleLabel.centerHorizontallyInSuperView()
        artistLabel.anchor(top: songTitleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 3, left: 0, bottom: 0, right: 0))
        artistLabel.centerHorizontallyInSuperView()
    }
}


// MARK: - PlayerContainerDelegate
extension SongContainerVC: PlayerContainerDelegate {
    
    func buttonPressed(index: Int) {
        setupUI(with: songs[index])
    }
}
