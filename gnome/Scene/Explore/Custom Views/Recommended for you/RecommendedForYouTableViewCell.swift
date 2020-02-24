import UIKit

class RecommendedForYouTableViewCell: UITableViewCell {

    // MARK: - Properties
    struct Storybaord {
        static let RecommendedForYouReusableCell =  "RecentlyPlayedReusableCell"
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


// MARK: - Fileprivate methods
extension RecommendedForYouTableViewCell {
    
    fileprivate func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    fileprivate func registerCells() {
        collectionView.register(UINib(nibName: String(describing: SongCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: Storybaord.RecommendedForYouReusableCell)
    }
    
}


// MARK: - UICollectionView
extension RecommendedForYouTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storybaord.RecommendedForYouReusableCell, for: indexPath) as! SongCollectionViewCell
        cell.setup(cellType: .recommendecForYou)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecommendedForYouTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 232)
    }
    
}
