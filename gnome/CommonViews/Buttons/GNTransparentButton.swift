import UIKit

class GNTransparentButton: UIView {

    // MARK: Properties
    let button = UIButton(frame: .zero)
    let placeholderImageView = UIImageView(frame: .zero)
    var action: (() -> Void)?
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    convenience init(assert: UIImage, color: UIColor, transparency: CGFloat, dimensions: CGFloat) {
        self.init(frame: .zero)
        alpha = transparency
        backgroundColor = color
        layer.cornerRadius = dimensions / 2
        placeholderImageView.image = assert
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension GNTransparentButton {
    
    @objc func buttonPressed() { action?() }
    
    
    private func configureUI() {
        let dimensions: CGFloat = 22.5
        placeholderImageView.contentMode = .scaleAspectFit
        
        addSubviews(placeholderImageView, button)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        placeholderImageView.centerInSuperview(size: .init(width: dimensions, height: dimensions))
        button.fillSuperview()
    }
}
