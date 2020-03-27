import UIKit

class ExploreViewController: UIViewController {

    // MARK: - Properties
    var viewModel: ExploreViewModel!
    
    
    public class var storyboardName: String {
        return "Explore"
    }
    
    
    static func create(viewModel: ExploreViewModel) -> ExploreViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ExploreViewController.self)) as? ExploreViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNavigationBar()
    }
}


// MARK: - Fileprivate methods
extension ExploreViewController {
    
    fileprivate func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    fileprivate func setupCollectionView() {
        collectionView.register(UINib(nibName: String(describing: ExploreCategoryCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: ExploreCategoryCell.reuseId)
        collectionView.dataSource   = self
        collectionView.delegate     = self
    }
}


// MARK: - Collection View Data Source
extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCategoryCell.reuseId, for: indexPath) as! ExploreCategoryCell
        cell.backgroundColor = .red
        return cell
    }
}


// MARK: - Collection View Delegate
extension ExploreViewController: UICollectionViewDelegate {}


// MARK: - Collection View Delegate
extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 180)
    }
    
}

