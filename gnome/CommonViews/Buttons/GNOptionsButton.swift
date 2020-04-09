import UIKit

class GNOptionsButton: UIView {
    
    let button                  = UIButton(frame: .zero)
    let placeholderImageView    = UIImageView(frame: .zero)
    var action: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    @objc func buttonPressed() { action?() }
    

    private func configure() {
                
        addSubview(placeholderImageView)
        addSubview(button)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        translatesAutoresizingMaskIntoConstraints                           = false
        button.translatesAutoresizingMaskIntoConstraints                    = false
        placeholderImageView.translatesAutoresizingMaskIntoConstraints      = false
        
        placeholderImageView.image = Asserts.option
        
        NSLayoutConstraint.activate([
            placeholderImageView.topAnchor.constraint(equalTo: topAnchor),
            placeholderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            placeholderImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
