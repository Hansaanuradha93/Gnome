import UIKit

class ExpanVC: UIViewController {

    private let viewModel       = ExpanVM()
    private let backButton      = GNTransparentButton(assert: Asserts.back, color: .black, transparency: 0.25, dimensions: 44)
    private var collectionView  : UICollectionView!
    private var artist          : Artist!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil) }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    convenience init(artist: Artist) {
        self.init()
        
        self.artist = artist
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
        configureBackButton()
    }
}


// MARK: - Methods
extension ExpanVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        collectionView.dataSource       = self
        collectionView.delegate         = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ExpanArtistThumbnailCell.self, forCellWithReuseIdentifier: ExpanArtistThumbnailCell.reuseID)
        collectionView.register(ArtistPopularSongsCell.self, forCellWithReuseIdentifier: ArtistPopularSongsCell.reuseID)
        collectionView.register(ExpanRowCell.self, forCellWithReuseIdentifier: ExpanRowCell.reuseID)


        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout              = UICollectionViewFlowLayout()
        flowLayout.scrollDirection  = .vertical
        flowLayout.sectionInset     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return flowLayout
    }
    
    
    private func configureBackButton() {
        
        backButton.action               = { () in self.dismiss(animated: true) }
        
        let dimensions: CGFloat         = 44
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: dimensions),
            backButton.widthAnchor.constraint(equalToConstant: dimensions)
        ])
    }
}


// MARK: - Collection View Data Source
extension ExpanVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return viewModel.sections.count }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 1}
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let section = viewModel.sections[indexPath.section]
        
        switch section.sectionType {
            
        case .thumbnail:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpanArtistThumbnailCell.reuseID, for: indexPath) as! ExpanArtistThumbnailCell
            cell.setup(artist: artist!)
            return cell
        case .popularSongs:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistPopularSongsCell.reuseID, for: indexPath) as! ArtistPopularSongsCell
            return cell
        case .albums:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpanRowCell.reuseID, for: indexPath) as! ExpanRowCell
            return cell
        }
    }
}


// MARK: - Collection View Delegate
extension ExpanVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { print("Lets expan this") }
}


// MARK: - FlowLayout Delegate
extension ExpanVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section             = viewModel.sections[indexPath.section]

        let flowLayout          = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width               = UIScreen.main.bounds.size.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        
        switch section.sectionType {
            
        case .thumbnail:
            return CGSize(width: UIScreen.main.bounds.size.width, height: 390)
        case .popularSongs:
            return CGSize(width: width, height: 480)
        case .albums:
            return CGSize(width: width, height: 274)
        }
    }
}
