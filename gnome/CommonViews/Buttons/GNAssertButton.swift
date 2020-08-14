import UIKit

class GNAssertButton: UIView {

    // MARK: Properties
    let button = UIButton(frame: .zero)
    let placeholderImageView = UIImageView(frame: .zero)
    var action: (() -> Void)?
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    convenience init(assert: UIImage, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init(frame: .zero)
        placeholderImageView.image = assert
        placeholderImageView.contentMode = contentMode
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension GNAssertButton {
    
    @objc func buttonPressed() { action?() }

    
    private func configure() {
        addSubview(placeholderImageView)
        addSubview(button)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        translatesAutoresizingMaskIntoConstraints = false
        placeholderImageView.fillSuperview()
        button.fillSuperview()
    }
}
