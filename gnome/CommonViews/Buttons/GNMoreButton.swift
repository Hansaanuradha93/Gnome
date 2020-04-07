import UIKit

class GNMoreButton: UIView {

    let button                  = UIButton(frame: .zero)
    let placeholderImageView    = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .blue
        
        addSubview(placeholderImageView)
        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints                    = false
        placeholderImageView.translatesAutoresizingMaskIntoConstraints      = false
        
        placeholderImageView.image = Asserts.more
        
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
