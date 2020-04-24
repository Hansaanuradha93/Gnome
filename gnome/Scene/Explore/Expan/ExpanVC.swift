import UIKit

class ExpanVC: UIViewController {

    private let viewModel       = ExploreVM()
    private var collectionView  : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension ExpanVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureCollectionView() {
        
        collectionView                  = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor  = .systemBackground
        collectionView.dataSource       = self
//        collectionView.delegate         = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SongCell.self, forCellWithReuseIdentifier: SongCell.reuseID)

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
}


// MARK: - Collection View Data Source
extension ExpanVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 5 }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseID, for: indexPath) as! SongCell
        return cell
    }
}


// MARK: - Collection View Delegate
extension ExpanVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Lets expan this")
    }
}
