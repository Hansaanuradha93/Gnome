import UIKit

class PlayerContainerVC: UIViewController {

    private let viewModel   = PlayerContainerVM()
    private let sliderView  = UIView()
    private let playButton  = GNAssertButton(assert: Asserts.play)
    
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
        configurePlayButton()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension PlayerContainerVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
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
    
    
    private func configurePlayButton() {
        
        let dimensions: CGFloat = 70
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: 25),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: dimensions),
            playButton.widthAnchor.constraint(equalToConstant: dimensions)
        ])
    }
}
