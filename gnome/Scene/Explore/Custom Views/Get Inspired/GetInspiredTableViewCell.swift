import UIKit

class GetInspiredTableViewCell: UITableViewCell {

    struct Storybaord {
        static let GetInspiredReusableCell =  "GetInspiredReusableCell"
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: String(describing: LargeSongCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: Storybaord.GetInspiredReusableCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


// MARK: - UICollectionView
extension GetInspiredTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storybaord.GetInspiredReusableCell, for: indexPath) as! LargeSongCollectionViewCell
        cell.setup(cellType: .getInspired)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GetInspiredTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 232)
    }
    
}
