import UIKit

class ExpanArtistThumbnailCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "ExpanArtistCell"
    private let thumbnailImageView = GNThumbnaiImageView(radius: 0)
    private let playButton = GNAssertButton(assert: Asserts.pause)
    private let titleLabel = GNSecondaryTitleLabel(fontSize: 14, fontColor: .white)
    private let nameLabel = GNTitleLabel(fontSize: 32, textColour: .white)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
//        configureThumbnailImage()
//        setupNameLabel()
//        configureTitleLabel()
//        configurePlayButton()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension ExpanArtistThumbnailCell {
    
    func setup(artist: Artist) {
        thumbnailImageView.image = UIImage(named: artist.largeThumbnailUrl)
        titleLabel.text = Titles.artist
        nameLabel.text = artist.name
    }
    
    
    private func configureUI() {
        let dimensions: CGFloat = 70
        titleLabel.alpha = 0.85

        addSubview(thumbnailImageView)
        thumbnailImageView.addSubview(nameLabel)
        thumbnailImageView.addSubview(titleLabel)
        addSubview(playButton)
        
        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 35, right: 0))
        nameLabel.anchor(top: nil, leading: thumbnailImageView.leadingAnchor, bottom: thumbnailImageView.bottomAnchor, trailing: thumbnailImageView.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 32, right: 16))
        titleLabel.anchor(top: nil, leading: thumbnailImageView.leadingAnchor, bottom: nameLabel.topAnchor, trailing: thumbnailImageView.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        playButton.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16), size: .init(width: dimensions, height: dimensions))
        playButton.centerYAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor).isActive = true
        
    }
    
    
//    private func configureThumbnailImage() {
//        addSubview(thumbnailImageView)
//
//        NSLayoutConstraint.activate([
//            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
//            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35)
//        ])
//    }
    
    
//    private func configureTitleLabel() {
//        titleLabel.alpha = 0.85
//        thumbnailImageView.addSubview(titleLabel)
//
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: thumbnailImageView.trailingAnchor, constant: -16),
//            titleLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor)
//        ])
//    }
    
    
//    private func setupNameLabel() {
//        thumbnailImageView.addSubview(nameLabel)
//
//        NSLayoutConstraint.activate([
//            nameLabel.leadingAnchor.constraint(lessThanOrEqualTo: thumbnailImageView.leadingAnchor, constant: 16),
//            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: thumbnailImageView.trailingAnchor, constant: -16),
//            nameLabel.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: -32)
//        ])
//    }
    
    
//    private func configurePlayButton() {
//        let dimensions: CGFloat = 70
//        addSubview(playButton)
//
//        NSLayoutConstraint.activate([
//            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            playButton.centerYAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor),
//            playButton.widthAnchor.constraint(equalToConstant: dimensions),
//            playButton.heightAnchor.constraint(equalToConstant: dimensions)
//        ])
//    }
}
