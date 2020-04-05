import UIKit

class ExploreVC: UIViewController {

    private var viewModel       = ExploreVM()
    private let titleLabel      = GNTitleLabel(fontSize: 34)
    private var collectionView  : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTitleLabel()
        configureCollectionView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension ExploreVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureTitleLabel() {
        
        view.addSubview(titleLabel)
        titleLabel.text = Titles.explore
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
    }

    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        collectionView.dataSource       = self
        collectionView.delegate         = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RowCell.self, forCellWithReuseIdentifier: RowCell.reuseID)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout              = UICollectionViewFlowLayout()
        flowLayout.scrollDirection  = .vertical
        flowLayout.sectionInset     = UIEdgeInsets(top: 0, left: 16, bottom: 28, right: 16)
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension ExploreVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return viewModel.sections.count }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 1 }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RowCell.reuseID, for: indexPath) as! RowCell

        switch viewModel.sections[indexPath.section].sectionType {
        case .recentlyPlayed:
            cell.setup(cellType: .recentlyPlayed)
        case .recommendedForYou:
            cell.setup(cellType: .recommendedForYou)
        case .getInspired:
            cell.setup(cellType: .getInspired)
        case .popularArtists:
            cell.setup(cellType: .popularArtists)
        case .genres:
            cell.setup(cellType: .genres)
        }
        return cell
    }
}


// MARK: - FlowLayout Delegate
extension ExploreVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout          = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width               = UIScreen.main.bounds.size.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        let padding: CGFloat    = 0
        
        switch viewModel.sections[indexPath.section].sectionType {
        case .recentlyPlayed:
            return CGSize(width: width, height: 180 + padding)
        case .recommendedForYou:
            return CGSize(width: width, height: 272 + padding)
        case .getInspired:
            return CGSize(width: width, height: 276 + padding)
        case .popularArtists:
            return CGSize(width: width, height: 180 + padding)
        case .genres:
            return CGSize(width: width, height: 110 + padding)
        }
    }
}

