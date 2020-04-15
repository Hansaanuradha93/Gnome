import UIKit

class PlayerContainerVC: UIViewController {

    private let viewModel           = PlayerContainerVM()
    private let stackView           = UIStackView()
    private let slider              = GNSlider(frame: .zero)
    private let sliderMinimumLabel  = GNSecondaryTitleLabel(fontSize: 11, fontColor: UIColor.appColor(.Pretty_Pink))
    private let sliderMaximumLabel  = GNSecondaryTitleLabel(fontSize: 11, fontColor: UIColor.appColor(.Pretty_Pink))
    private let playButton          = GNAssertButton(assert: Asserts.play)
    private let rewindButton        = GNAssertButton(assert: Asserts.rewind)
    private let rewind30Button      = GNAssertButton(assert: Asserts.rewind30)
    private let forwadButton        = GNAssertButton(assert: Asserts.forward)
    private let forward30Button     = GNAssertButton(assert: Asserts.forward30)
    private let favouriteButton     = GNAssertButton(assert: Asserts.favorite, contentMode: .center)
    private let shuffleButton       = GNAssertButton(assert: Asserts.shuffle, contentMode: .center)
    private let repeatButton        = GNAssertButton(assert: Asserts.repeatAgain, contentMode: .center)
    private let queueMusicButton    = GNAssertButton(assert: Asserts.queueMusic, contentMode: .center)

    
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
        configureSliderLabels()
        configurePlayButton()
        configureRewindButtons()
        configureStackView()
        configureOtherButtons()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension PlayerContainerVC {
    
    @objc func sliderChanged() { sliderMinimumLabel.text = "\(slider.value)" }
    
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureSlider() {
        
        view.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.minimumValue         = 0
        slider.maximumValue         = 1000
        slider.isContinuous         = true
        slider.layer.cornerRadius   = 30
        slider.value                = 500
        slider.tintColor            = UIColor.appColor(.Pretty_Pink)
        slider.setThumbImage(Asserts.sliderThumb, for: .normal)
        slider.setThumbImage(Asserts.sliderThumb, for: .highlighted)
        slider.addTarget(self, action: #selector(sliderChanged),for: .valueChanged)
        
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: view.topAnchor),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            slider.heightAnchor.constraint(equalTo: slider.widthAnchor, multiplier: 12 / 317)
        ])
    }
    
    
    private func configureSliderLabels() {
        
        view.addSubview(sliderMinimumLabel)
        view.addSubview(sliderMaximumLabel)
        
        sliderMinimumLabel.text = "\(slider.minimumValue)"
        sliderMaximumLabel.text = "\(slider.maximumValue)"
        
        NSLayoutConstraint.activate([
            sliderMinimumLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 8),
            sliderMinimumLabel.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
            
            sliderMaximumLabel.topAnchor.constraint(equalTo: sliderMinimumLabel.topAnchor),
            sliderMaximumLabel.trailingAnchor.constraint(equalTo: slider.trailingAnchor)
        ])
    }
    
    
    private func configurePlayButton() {
        
        let dimensions: CGFloat = 70
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 25),
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
    
    
    private func configureStackView() {
        
        stackView.axis          = .horizontal
        stackView.distribution  = .fillEqually
        
        stackView.addArrangedSubview(favouriteButton)
        stackView.addArrangedSubview(shuffleButton)
        stackView.addArrangedSubview(repeatButton)
        stackView.addArrangedSubview(queueMusicButton)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 45)
        ])

    }
    
    
    private func configureOtherButtons() {
        
        let value: CGFloat = 0.5
        
        favouriteButton.alpha   = value
        shuffleButton.alpha     = value
        repeatButton.alpha      = value
        queueMusicButton.alpha  = value
    }
}
