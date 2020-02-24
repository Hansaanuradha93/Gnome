import UIKit

class RecentlyPlayedTableViewCell: UITableViewCell {

    // MARK: - Properties
    struct Storybaord {
        static let RecentlyPlayedReusableCell =  "RecentlyPlayedReusableCell"
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCells()
        configureCellectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


// MARK: - Fileprivate methods
extension RecentlyPlayedTableViewCell {
    
    fileprivate func registerCells() {
        collectionView.register(UINib(nibName: String(describing: LargeSongCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: Storybaord.RecentlyPlayedReusableCell)
    }
    
    fileprivate func configureCellectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


// MARK: - UICollectionView
extension RecentlyPlayedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storybaord.RecentlyPlayedReusableCell, for: indexPath) as! LargeSongCollectionViewCell
        cell.setup(cellType: .recentlyPlayed)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecentlyPlayedTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 155)
    }
    
}
