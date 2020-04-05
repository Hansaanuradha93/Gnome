import UIKit

class HorizontalCollectionViewVC: UIViewController {

    private var genres          = [Genre]()
    private var collectionView  : UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchGenres()
        configureCollectionView()
    }
}


// MARK: - Methods
extension HorizontalCollectionViewVC {
    
    private func fetchGenres() {
        genres = Genre.fetchGenres()
    }
    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        collectionView.dataSource       = self
        collectionView.delegate         = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.reuseID)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
        

    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout              = UICollectionViewFlowLayout()
        flowLayout.scrollDirection  = .horizontal
        flowLayout.sectionInset     = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return flowLayout
    }
}


// MARK: - Collection View Data Source
extension HorizontalCollectionViewVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 20 }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
        return cell
    }
}



// MARK: - FlowLayout Delegate
extension HorizontalCollectionViewVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
