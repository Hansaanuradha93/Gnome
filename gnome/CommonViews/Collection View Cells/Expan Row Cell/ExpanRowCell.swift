import UIKit

class ExpanRowCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID                  = "ExpanRowCell"
    private let titleLabel              = GNTitleLabel(fontSize: 22)
    private var collectionView          : UICollectionView!
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ExpanRowCell {
    
    
    private func configureTitleLabel() {
        
        titleLabel.text = "Albums"
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
}

