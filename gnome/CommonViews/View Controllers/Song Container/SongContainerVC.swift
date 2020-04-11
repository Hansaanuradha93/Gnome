import UIKit

class SongContainerVC: UIViewController {

    private let viewModel           = SongContainerVM()
    private let titleLabel          = GNSecondaryTitleLabel(fontSize: 17, alignment: .center, fontColor: UIColor.appColor(.Pretty_Pink))
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    var song: Song!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(song: Song) {
        self.init()
        self.song = song
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTitleLabel()
        configureThumbnailImageView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension SongContainerVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureTitleLabel() {
        
        view.addSubview(titleLabel)
        titleLabel.text = "Song Title"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func configureThumbnailImageView() {
        
        let padding: CGFloat = 29
        view.addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            thumbnailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 317),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 317)
        ])
    }
}
