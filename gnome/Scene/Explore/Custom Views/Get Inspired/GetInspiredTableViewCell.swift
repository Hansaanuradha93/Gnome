import UIKit

class GetInspiredTableViewCell: UITableViewCell {

    
    // MARK: - Properties
    struct Storybaord {
        static let GetInspiredReusableCell =  "GetInspiredReusableCell"
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCells()
        configureCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


// MARK: - Fileprivate methods
extension GetInspiredTableViewCell {
    
    fileprivate func registerCells() {
        collectionView.register(UINib(nibName: String(describing: LargeSongCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: Storybaord.GetInspiredReusableCell)
    }
    
    fileprivate func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
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
