import UIKit
import AVFoundation

protocol PlayerContainerDelegate: class { func buttonPressed(index: Int)}


class PlayerContainerVC: UIViewController {

    // MARK: Properties
    private let viewModel = PlayerContainerVM()
    
    private let stackView = UIStackView()
    private let slider = GNSlider(frame: .zero)
    private let sliderMinimumLabel = GNSecondaryTitleLabel(fontSize: 11, fontColor: UIColor.appColor(.Pretty_Pink))
    private let sliderMaximumLabel = GNSecondaryTitleLabel(fontSize: 11, fontColor: UIColor.appColor(.Pretty_Pink))
    private let playButton = GNAssertButton(assert: Asserts.play)
    private let backwardButton = GNAssertButton(assert: Asserts.rewind)
    private let rewind30Button = GNAssertButton(assert: Asserts.rewind30)
    private let forwadButton = GNAssertButton(assert: Asserts.forward)
    private let forward30Button = GNAssertButton(assert: Asserts.forward30)
    private let favouriteButton = GNAssertButton(assert: Asserts.favorite, contentMode: .center)
    private let shuffleButton = GNAssertButton(assert: Asserts.shuffle, contentMode: .center)
    private let repeatButton = GNAssertButton(assert: Asserts.repeatAgain, contentMode: .center)
    private let queueMusicButton = GNAssertButton(assert: Asserts.queueMusic, contentMode: .center)

    private var player: AVAudioPlayer!
    private var songs: [Song]!
    private var index: Int!
    var playerContainerDelegate: PlayerContainerDelegate?
    
    
    // MARK: Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(songs: [Song], index: Int) {
        self.init()
        self.songs = songs
        self.index = index
    }
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureSliderLabels()
        configurePlayButton()
        configureRewindButtons()
        configureStackView()
        configureOtherButtons()
        
        prepareSongSesstion(song: songs[index])
        configureSongPlayer()
        configureForward30Button()
        configureRewind30Button()
        configureForwardButtonAction()
        configureBackwardButtonAction()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewController()
    }
}


// MARK: - Methods
extension PlayerContainerVC {
    
    @objc func sliderChanged() {
        sliderMinimumLabel.text = Double(slider.value).getTimeFormat()
        player.stop()
        player.currentTime = TimeInterval(slider.value)
        player.play()
    }
    
    
    @objc func updateSlider() {
        if player.isPlaying {
            sliderMinimumLabel.text = player.currentTime.getTimeFormat()
            slider.value = Float(Int(player.currentTime))
        }
    }
    
    
    private func prepareSongSesstion(song: Song) {
        guard let urlString = Bundle.main.path(forResource: song.file.name, ofType: song.file.type), let url = URL(string: urlString) else  { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
            let session = AVAudioSession.sharedInstance()
            
            do { try session.setCategory(.playback) }
            catch let sessionError { print("Session Error: \(sessionError)") }
            
        } catch let playerError { print("Song Player Error: \(playerError)") }
    }

    
    private func configureSongPlayer() {
        player.play()
        
        slider.maximumValue = Float(Int(player.duration))
        sliderMinimumLabel.text = player.currentTime.getTimeFormat()
        sliderMaximumLabel.text = player.duration.getTimeFormat()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        playButton.action = { () in
            if self.player.isPlaying {
                self.playButton.placeholderImageView.image = Asserts.pause
                self.player.pause()
            } else {
                self.playButton.placeholderImageView.image = Asserts.play
                self.player.play()
            }
        }
    }
    
    
    private func configureForwardButtonAction() {
        forwadButton.action = { () in
            if self.index == self.songs.count - 1 {
                self.index = 0
            } else {
                self.index = self.index + 1
            }
            self.playerContainerDelegate?.buttonPressed(index: self.index )
            self.playNextSong()
        }
    }
    
    
    private func configureBackwardButtonAction() {
        backwardButton.action = { () in
            if self.index != 0 { self.index = self.index - 1 }
            self.playerContainerDelegate?.buttonPressed(index: self.index)
            self.playNextSong()
        }
    }
    
    
    private func playNextSong() {
        player.stop()
        prepareSongSesstion(song: self.songs[self.index])
        player.play()
        sliderMaximumLabel.text = player.duration.getTimeFormat()
        slider.maximumValue = Float(Int(player.duration))
    }
    
    
    private func configureRewind30Button() {
        rewind30Button.action = { () in
            
            self.player.stop()
            var time = self.player.currentTime
            time = time - 30
            
            if time < 0 {
                self.player.currentTime = 0
            } else {
                self.player.currentTime = time
            }
            
            self.player.play()
            self.slider.value = Float(Int(self.player.currentTime))
            self.sliderMinimumLabel.text = self.player.currentTime.getTimeFormat()
        }
    }
    
    
    private func configureForward30Button() {
        forward30Button.action              = { () in
            
            self.player.stop()
            var time = self.player.currentTime
            time = time + 30
            
            if time > self.player.duration {
                self.player.currentTime = self.player.duration
                self.slider.value = Float(self.player.duration)
                self.player.stop()
            } else {
                self.player.currentTime = time
            }
            
            self.player.play()
            self.slider.value = Float(Int(self.player.currentTime))
            self.sliderMinimumLabel.text = self.player.currentTime.getTimeFormat()
        }
    }
}


// MARK: - UI Imaplemetation
extension PlayerContainerVC {

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureSlider() {
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.minimumValue = 0
        slider.isContinuous = true
        slider.layer.cornerRadius = 30
        slider.tintColor = UIColor.appColor(.Pretty_Pink)
        
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
        let dimension: CGFloat = 36
        let dimension30: CGFloat = 24
        
        view.addSubview(backwardButton)
        view.addSubview(rewind30Button)
        view.addSubview(forwadButton)
        view.addSubview(forward30Button)
        
        NSLayoutConstraint.activate([
            backwardButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -25),
            backwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            backwardButton.widthAnchor.constraint(equalToConstant: dimension),
            backwardButton.heightAnchor.constraint(equalToConstant: dimension),
            
            rewind30Button.centerYAnchor.constraint(equalTo: backwardButton.centerYAnchor),
            rewind30Button.trailingAnchor.constraint(equalTo: backwardButton.leadingAnchor, constant: -30),
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
        stackView.axis = .horizontal
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
        
        favouriteButton.alpha = value
        shuffleButton.alpha = value
        repeatButton.alpha = value
        queueMusicButton.alpha = value
    }
}
