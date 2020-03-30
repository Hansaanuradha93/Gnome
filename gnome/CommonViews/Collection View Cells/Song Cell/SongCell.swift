import UIKit

class SongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "SongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let songTitleLabel      = GNSecondaryTitleLabel(fontSize: 15)
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(thumbnailImageView)
        addSubview(songTitleLabel)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 144.33),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 144.33),
            
            songTitleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 4.7),
            songTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            songTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            songTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
