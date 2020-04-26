import UIKit

class GNTransparentButton: UIView {

    let button                  = UIButton(frame: .zero)
    let placeholderImageView    = UIImageView(frame: .zero)
    var action: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    convenience init(assert: UIImage, color: UIColor, transparency: CGFloat, dimensions: CGFloat) {
        self.init(frame: .zero)
        
        alpha                               = transparency
        backgroundColor                     = color
        layer.cornerRadius                  = dimensions / 2
        placeholderImageView.image          = assert
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    @objc func buttonPressed() { action?() }
    
    
    private func configure() {
                
        let dimensions: CGFloat             = 22.5
        placeholderImageView.contentMode    = .scaleAspectFit
        
        addSubview(placeholderImageView)
        addSubview(button)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        translatesAutoresizingMaskIntoConstraints                           = false
        button.translatesAutoresizingMaskIntoConstraints                    = false
        placeholderImageView.translatesAutoresizingMaskIntoConstraints      = false
                        
        NSLayoutConstraint.activate([
            placeholderImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholderImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeholderImageView.widthAnchor.constraint(equalToConstant: dimensions),
            placeholderImageView.heightAnchor.constraint(equalToConstant: dimensions),

            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
