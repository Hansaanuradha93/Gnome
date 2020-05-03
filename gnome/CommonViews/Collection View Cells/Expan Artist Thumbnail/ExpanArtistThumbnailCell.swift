import UIKit

class ExpanArtistThumbnailCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID              = "ExpanArtistCell"
    private let thumbnailImageView  = GNThumbnaiImageView(radius: 0)
    private let playButton          = GNAssertButton(assert: Asserts.pause)
    private let titleLabel          = GNSecondaryTitleLabel(fontSize: 15, fontColor: .white)
    private let nameLabel           = GNTitleLabel(fontSize: 32, textColour: .white)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureThumbnailImage()
        setupNameLabel()
        configureTitleLabel()
        configurePlayButton()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension ExpanArtistThumbnailCell {
    
    func setup(artist: Artist) {
        thumbnailImageView.image    = UIImage(named: artist.largeThumbnailUrl)
        titleLabel.text             = Titles.artist
        nameLabel.text              = artist.name
    }
    
    
    private func configureThumbnailImage() {
                    
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35)
        ])
    }
    
    
    private func configureTitleLabel() {
        
        thumbnailImageView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -12),
        ])
    }
    
    
    private func setupNameLabel() {
        
        thumbnailImageView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(lessThanOrEqualTo: thumbnailImageView.leadingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: -32)
        ])
    }
    
    
    private func configurePlayButton() {
        
        let dimensions: CGFloat = 70
        addSubview(playButton)
        
        NSLayoutConstraint.activate([
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            playButton.centerYAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor),
            playButton.widthAnchor.constraint(equalToConstant: dimensions),
            playButton.heightAnchor.constraint(equalToConstant: dimensions)
        ])
    }
}
