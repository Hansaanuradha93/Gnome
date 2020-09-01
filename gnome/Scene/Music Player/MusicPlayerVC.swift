import UIKit

class MusicPlayerVC: UIViewController {

    private let viewModel = MusicPlayerVM()
    
    private let collapseButton = GNAssertButton(assert: Asserts.collapse)
    private let optionButton = GNAssertButton(assert: Asserts.option)
    private let nowPlayingLabel = GNSecondaryTitleLabel(fontSize: 13, alignment: .center)
    private let songContainer = UIView()
    private let playContainer = UIView()
    private var songs: [Song]!
    private var index: Int!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(songs: [Song], index: Int) {
        self.init()
        self.songs = songs
        self.index = index
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureButtons()
        configureUI()
        
//        configureNowPlayingLabel()
//        configureSongContaier()
//        configurePlayerContainer()
//        configureUIElements()
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
    
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        self.addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    private func configureUI() {
        view.addSubview(collapseButton)
        view.addSubview(optionButton)
        view.addSubview(nowPlayingLabel)
        view.addSubview(songContainer)
        view.addSubview(playContainer)


        optionButton.alpha = 0.5
        let topPadding: CGFloat = 69
        let sidePadding: CGFloat = 29
        let dimensions: CGFloat = 20
        
        collapseButton.action = { () in self.dismiss(animated: true) }
        nowPlayingLabel.alpha = 0.6
        nowPlayingLabel.text = Titles.nowPlaying

        collapseButton.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: topPadding, left: sidePadding, bottom: 0, right: 0),size: .init(width: dimensions, height: dimensions / 2))
        optionButton.anchor(top: collapseButton.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -5, left: 0, bottom: 0, right: sidePadding), size: .init(width: dimensions, height: dimensions))
        nowPlayingLabel.anchor(top: collapseButton.topAnchor, leading: nil, bottom: nil, trailing: nil)
        nowPlayingLabel.centerHorizontallyInSuperView(size: .init(width: 140, height: 13))
        songContainer.anchor(top: nowPlayingLabel.bottomAnchor, leading: collapseButton.leadingAnchor, bottom: nil, trailing: optionButton.trailingAnchor)
        songContainer.heightAnchor.constraint(equalTo: songContainer.widthAnchor, multiplier: 451 / 317).isActive = true
        playContainer.anchor(top: songContainer.bottomAnchor, leading: songContainer.leadingAnchor, bottom: nil, trailing: songContainer.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        playContainer.heightAnchor.constraint(equalTo: playContainer.widthAnchor, multiplier: 197 / 317).isActive = true
        
        let playerContainerVC = PlayerContainerVC(songs: songs, index: index)
        let songContainerVC = SongContainerVC(songs: songs, index: index, controller: playerContainerVC)
        
        add(childVC: playerContainerVC, to: playContainer)
        add(childVC: songContainerVC, to: songContainer)
    }
    
    
//    private func configureButtons() {
//        view.addSubview(collapseButton)
//        view.addSubview(optionButton)
//
//        optionButton.alpha = 0.5
//        let topPadding: CGFloat = 69
//        let sidePadding: CGFloat = 29
//
//        collapseButton.action = { () in self.dismiss(animated: true) }
//
//        NSLayoutConstraint.activate([
//            collapseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
//            collapseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
//            collapseButton.widthAnchor.constraint(equalToConstant: 16.98),
//            collapseButton.heightAnchor.constraint(equalToConstant: 10.48),
//
//            optionButton.topAnchor.constraint(equalTo: collapseButton.topAnchor),
//            optionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding),
//            optionButton.widthAnchor.constraint(equalToConstant: 16),
//            optionButton.heightAnchor.constraint(equalToConstant: 14)
//        ])
//    }
    
    
//    private func configureNowPlayingLabel() {
//        view.addSubview(nowPlayingLabel)
//        nowPlayingLabel.alpha = 0.6
//        nowPlayingLabel.text = Titles.nowPlaying
//
//        NSLayoutConstraint.activate([
//            nowPlayingLabel.topAnchor.constraint(equalTo: collapseButton.topAnchor),
//            nowPlayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nowPlayingLabel.widthAnchor.constraint(equalToConstant: 140),
//            nowPlayingLabel.heightAnchor.constraint(equalToConstant: 13)
//        ])
//    }
    
    
//    private func configureSongContaier() {
//        view.addSubview(songContainer)
//        songContainer.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            songContainer.topAnchor.constraint(equalTo: nowPlayingLabel.bottomAnchor, constant: 12),
//            songContainer.leadingAnchor.constraint(equalTo: collapseButton.leadingAnchor),
//            songContainer.trailingAnchor.constraint(equalTo: optionButton.trailingAnchor),
//            songContainer.heightAnchor.constraint(equalTo: songContainer.widthAnchor, multiplier: 451 / 317)
//        ])
//    }
    
    
//    private func configurePlayerContainer() {
//        view.addSubview(playContainer)
//        playContainer.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            playContainer.topAnchor.constraint(equalTo: songContainer.bottomAnchor, constant: 20),
//            playContainer.leadingAnchor.constraint(equalTo: songContainer.leadingAnchor),
//            playContainer.trailingAnchor.constraint(equalTo: songContainer.trailingAnchor),
//            playContainer.heightAnchor.constraint(equalTo: playContainer.widthAnchor, multiplier: 197 / 317)
//        ])
//    }
    
    
    
    
    
//    private func configureUIElements() {
//        let playerContainerVC = PlayerContainerVC(songs: songs, index: index)
//        let songContainerVC = SongContainerVC(songs: songs, index: index, controller: playerContainerVC)
//
//        add(childVC: playerContainerVC, to: playContainer)
//        add(childVC: songContainerVC, to: songContainer)
//    }
}
