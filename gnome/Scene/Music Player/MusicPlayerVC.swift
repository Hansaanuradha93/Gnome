import UIKit

class MusicPlayerVC: UIViewController {

    private let viewModel       = MusicPlayerVM()
    private let collapseButton  = GNAssertButton(assert: Asserts.collapse)
    private let optionButton    = GNAssertButton(assert: Asserts.option)
    private let nowPlayingLabel = GNSecondaryTitleLabel(fontSize: 13, alignment: .center)
    private let songContainer   = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        configureNowPlayingLabel()
        configureSongContaier()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension MusicPlayerVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureButtons() {
        
        view.addSubview(collapseButton)
        view.addSubview(optionButton)
        
        optionButton.alpha          = 0.5
        let topPadding: CGFloat     = 69
        let sidePadding: CGFloat    = 29

        
        NSLayoutConstraint.activate([
            collapseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            collapseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            collapseButton.widthAnchor.constraint(equalToConstant: 16.98),
            collapseButton.heightAnchor.constraint(equalToConstant: 10.48),
            
            optionButton.topAnchor.constraint(equalTo: collapseButton.topAnchor),
            optionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
            optionButton.widthAnchor.constraint(equalToConstant: 16),
            optionButton.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    
    private func configureNowPlayingLabel() {
        
        view.addSubview(nowPlayingLabel)
        nowPlayingLabel.alpha   = 0.6
        nowPlayingLabel.text    = Titles.nowPlaying
        
        NSLayoutConstraint.activate([
            nowPlayingLabel.topAnchor.constraint(equalTo: collapseButton.topAnchor),
            nowPlayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nowPlayingLabel.widthAnchor.constraint(equalToConstant: 140),
            nowPlayingLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
    
    
    private func configureSongContaier() {
        view.addSubview(songContainer)
        songContainer.translatesAutoresizingMaskIntoConstraints = false
        songContainer.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            songContainer.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor, constant: 12),
            songContainer.leadingAnchor.constraint(equalTo: collapseButton.leadingAnchor),
            songContainer.trailingAnchor.constraint(equalTo: optionButton.trailingAnchor),
            songContainer.heightAnchor.constraint(equalToConstant: 451)
        ])
    }
}
