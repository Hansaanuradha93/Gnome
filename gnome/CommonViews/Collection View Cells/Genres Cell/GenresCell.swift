import UIKit

class GenresCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "GenresCell"
    private let titleLabel = GNTitleLabel(fontSize: 20, textColour: .white, alignment: .center)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleLabel()
        configureBackground()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension GenresCell {
    
    func setup(genre: Genre) { titleLabel.text = genre.title }
    
    
    private func configureBackground() {
        backgroundColor = UIColor.appColor(.Pretty_Pink)
        addCornerRadius(of: 12)
    }
    
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
