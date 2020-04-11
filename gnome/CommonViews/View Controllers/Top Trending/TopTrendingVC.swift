import UIKit

class TopTrendingVC: UIViewController {

    private let viewModel           = TopTrendingVM()
    private var collectionView      : UICollectionView!
    private var topTrendingSongs    : [TopTrendingSong] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        fetchTopTrendingSongs()
    }
}


// MARK: - Methods
extension TopTrendingVC {
    
    private func fetchTopTrendingSongs() { topTrendingSongs = TopTrendingSong.fetchTopTrendingSongs() }

    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        collectionView.dataSource       = self
        collectionView.delegate         = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TopTrendingCell.self, forCellWithReuseIdentifier: TopTrendingCell.reuseID)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.scrollDirection      = .vertical
        flowLayout.sectionInset         = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing   = 20.7
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
