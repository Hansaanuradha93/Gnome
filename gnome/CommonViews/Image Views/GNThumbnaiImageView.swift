import UIKit

class GNThumbnaiImageView: UIImageView {
    
    // MARK: Properties
    private let placeholderImage = CommonImages.placeholder
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    convenience init(radius: CGFloat) {
        self.init(frame: .zero)
        layer.cornerRadius = radius
    }
}


// MARK: - Fileprivate Methods
fileprivate extension GNThumbnaiImageView {
    
    func configure() {
        layer.cornerRadius = 15
        clipsToBounds = true
        image = placeholderImage
        contentMode = .scaleAspectFit
    }
}
