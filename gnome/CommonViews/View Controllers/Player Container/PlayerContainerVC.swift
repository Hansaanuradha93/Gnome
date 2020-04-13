import UIKit

class PlayerContainerVC: UIViewController {

    private let viewModel           = PlayerContainerVM()
    private let sliderView          = UIView()
    private let playButton          = GNAssertButton(assert: Asserts.play)
    private let rewindButton        = GNAssertButton(assert: Asserts.rewind)
    private let rewind30Button      = GNAssertButton(assert: Asserts.rewind30)
    private let forwadButton        = GNAssertButton(assert: Asserts.forward)
    private let forward30Button     = GNAssertButton(assert: Asserts.forward30)
    
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
        configureRewindButtons()
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
    
    
    private func configureRewindButtons() {
        
        let dimension: CGFloat      = 36
        let dimension30: CGFloat    = 24
        
        view.addSubview(rewindButton)
        view.addSubview(rewind30Button)
        view.addSubview(forwadButton)
        view.addSubview(forward30Button)
        
        NSLayoutConstraint.activate([
            rewindButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -25),
            rewindButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            rewindButton.widthAnchor.constraint(equalToConstant: dimension),
            rewindButton.heightAnchor.constraint(equalToConstant: dimension),
            
            rewind30Button.centerYAnchor.constraint(equalTo: rewindButton.centerYAnchor),
            rewind30Button.trailingAnchor.constraint(equalTo: rewindButton.leadingAnchor, constant: -30),
            rewind30Button.widthAnchor.constraint(equalToConstant: dimension30),
            rewind30Button.heightAnchor.constraint(equalToConstant: dimension30),
            
            forwadButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 25),
            forwadButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            forwadButton.widthAnchor.constraint(equalToConstant: dimension),
            forwadButton.heightAnchor.constraint(equalToConstant: dimension),
            
            forward30Button.centerYAnchor.constraint(equalTo: forwadButton.centerYAnchor),
            forward30Button.leadingAnchor.constraint(equalTo: forwadButton.trailingAnchor, constant: 30),
            forward30Button.widthAnchor.constraint(equalToConstant: dimension30),
            forward30Button.heightAnchor.constraint(equalToConstant: dimension30)
        ])
    }
}
