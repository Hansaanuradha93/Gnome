import UIKit

class GNAssertButton: UIView {

    // MARK: Properties
    let button = UIButton(frame: .zero)
    let placeholderImageView = UIImageView(frame: .zero)
    var action: (() -> Void)?
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    convenience init(assert: UIImage, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init(frame: .zero)
        placeholderImageView.image = assert
        placeholderImageView.contentMode = contentMode
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Fileprivate Methods
fileprivate extension GNAssertButton {
    
    @objc func buttonPressed() { action?() }

    
    func configureUI() {
        addSubviews(placeholderImageView, button)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        placeholderImageView.fillSuperview()
        button.fillSuperview()
    }
}
