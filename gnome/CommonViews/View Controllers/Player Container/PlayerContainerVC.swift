import UIKit

class PlayerContainerVC: UIViewController {

    private let viewModel   = PlayerContainerVM()
    private let sliderView  = UIView()
    
    private var song: Song!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(song: Song) {
        
        self.init()
        self.song = song
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSlider()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension PlayerContainerVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .cyan
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureSlider() {
        
        view.addSubview(sliderView)
        sliderView.backgroundColor = .green
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sliderView.topAnchor.constraint(equalTo: view.topAnchor),
            sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sliderView.heightAnchor.constraint(equalTo: sliderView.widthAnchor, multiplier: 32 / 317)
        ])
    }
}
