import UIKit

class TopTrendingVC: UIViewController {

    // MARK: Properties
    private let viewModel = TopTrendingVM()
    
    private var collectionView: UICollectionView!
    private var topTrendingSongs: [TopTrendingSong] = []
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchTopTrendingSongs()
    }
}


// MARK: - Methods
extension TopTrendingVC {
    
    private func fetchTopTrendingSongs() { topTrendingSongs = TopTrendingSong.fetchTopTrendingSongs() }

    
    private func configureUI() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TopTrendingCell.self, forCellWithReuseIdentifier: TopTrendingCell.reuseID)
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 20.7
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension TopTrendingVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return topTrendingSongs.count }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopTrendingCell.reuseID, for: indexPath) as! TopTrendingCell
        cell.setup(topTrendingSong: topTrendingSongs[indexPath.item])
        return cell
    }
}


// MARK: - FlowLayout Delegate
extension TopTrendingVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { return CGSize(width: collectionView.bounds.width, height: 115) }
}
