import UIKit

class GenresCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "GenresCell"
    private let titleLabel = GNTitleLabel(fontSize: 20, textColour: .white, alignment: .center)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension GenresCell {
    
    func setup(genre: Genre) { titleLabel.text = genre.title }
    
    
    private func configureUI() {
        backgroundColor = UIColor.appColor(.Pretty_Pink)
        addCornerRadius(of: 12)
        addSubview(titleLabel)
        titleLabel.fillSuperview()
    }
}
