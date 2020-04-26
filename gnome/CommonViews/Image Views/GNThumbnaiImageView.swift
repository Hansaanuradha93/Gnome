import UIKit

class GNThumbnaiImageView: UIImageView {
    
    // MARK: - Properties
    private let placeholderImage = CommonImages.placeholder
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    convenience init(radius: CGFloat) {
        self.init(frame: .zero)
        
        layer.cornerRadius = radius
    }
    
    
    private func configure() {
        
        layer.cornerRadius  = 15
        clipsToBounds       = true
        image               = placeholderImage
        contentMode         = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
