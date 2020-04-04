import UIKit

class LargeSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "LargeSongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let titleLabel          = GNSecondaryTitleLabel(fontSize: 17, alignment: .left)
    private let artistLabel         = GNBodyLabel(fontSize: 13)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(song: Song) {
        thumbnailImageView.image    = song.thumbnailImage
        titleLabel.text             = song.title
        artistLabel.text            = song.artist
    }
    
    
    private func configure() {
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(artistLabel)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
