import UIKit

class SongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "SongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let songTitleLabel      = GNSecondaryTitleLabel(fontSize: 15, alignment: .left)
    
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
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor),
            
            songTitleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 4.7),
            songTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            songTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            songTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
