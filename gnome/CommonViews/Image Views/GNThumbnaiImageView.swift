import UIKit

class GNThumbnaiImageView: UIImageView {
    
    // MARK: - Properties
    private let placeholderImage = Asserts.placeholder
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 15
        clipsToBounds       = true
        image               = placeholderImage
        contentMode         = .scaleAspectFit
        image               = self.image?.withRenderingMode(.alwaysTemplate)
        tintColor           = UIColor.white
        backgroundColor     = UIColor.appColor(.Pretty_Pink)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
