import UIKit

class ExploreVC: UIViewController {

    // MARK: Properties
    private let viewModel = ExploreVM()
    
    private let titleLabel = GNTitleLabel(fontSize: 34)
    private var collectionView : UICollectionView!
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}


// MARK: - Private Methods
private extension ExploreVC {
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        titleLabel.text = Titles.explore
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ExploreRowCell.self, forCellWithReuseIdentifier: ExploreRowCell.reuseID)

        view.addSubviews(titleLabel, collectionView)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 23, left: 16, bottom: 16, right: 0), size: .init(width: 0, height: 44))
        collectionView.anchor(top: titleLabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 28, right: 16)
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension ExploreVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return viewModel.sections.count }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 1 }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreRowCell.reuseID, for: indexPath) as! ExploreRowCell

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
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = UIScreen.main.bounds.size.width - (flowLayout.sectionInset.left + flowLayout.sectionInset.right)
        let padding: CGFloat = 0
        
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

