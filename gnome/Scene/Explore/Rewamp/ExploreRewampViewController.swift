import UIKit

class ExploreRewampViewController: UIViewController {

    // MARK: - Properties
    var viewModel: ExploreRewampViewModel!
    
    
    public class var storyboardName: String {
        return "Explore"
    }
    
    static func create(viewModel: ExploreRewampViewModel) -> ExploreRewampViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ExploreRewampViewController.self)) as? ExploreRewampViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    struct Storybaord {
        static let RecentlyPlayedReusableCell =  "RecentlyPlayedReusableCell"
    }
    
    
    // MARK: - IBLoutlets
    
    @IBOutlet weak var collectionView: UICollectionView!

    

    // MARK: - View Controller
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
}

// MARK: - Fileprivate methods
extension ExploreRewampViewController {
    
    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: String(describing: SongCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: Storybaord.RecentlyPlayedReusableCell)
    }
    
    fileprivate func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - collection view datasource, delegate
extension ExploreRewampViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storybaord.RecentlyPlayedReusableCell, for: indexPath) as! SongCollectionViewCell
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ExploreRewampViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 155)
    }
    
}
