import UIKit

class SongContainerVC: UIViewController {

    private let viewModel   = SongContainerVM()
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
}
