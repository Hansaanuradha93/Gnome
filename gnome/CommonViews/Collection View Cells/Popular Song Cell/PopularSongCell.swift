import UIKit

class PopularSongCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "PopularSongCell"
    
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let titleLabel = GNTitleLabel(fontSize: 20)
    private let numberOfPlaysLabel = GNSecondaryBodyLabel(fontSize: 15, fontColor: UIColor.appColor(.Grey))
    private let moreButton = GNAssertButton(assert: Asserts.more)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension PopularSongCell {
    
    func setup(song: Song) {
        thumbnailImageView.image = UIImage(named: song.thumbnailUrl)
        titleLabel.text = song.title
        numberOfPlaysLabel.text = "\(song.numberOfPlays / 1000)K"
    }
    
    
    private func configureUI() {
        let dimensions: CGFloat = 32
        addSubviews(thumbnailImageView, titleLabel, numberOfPlaysLabel, moreButton)

        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, size: .init(width: self.frame.height, height: 0))
        titleLabel.anchor(top: topAnchor, leading: thumbnailImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: 30))
        numberOfPlaysLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor)
        moreButton.centerVerticallyInSuperView()
        moreButton.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, size: .init(width: dimensions, height: dimensions))
    }
}
