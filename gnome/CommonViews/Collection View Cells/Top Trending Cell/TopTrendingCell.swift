import UIKit

class TopTrendingCell: UICollectionViewCell {
    
    // MARK: Properties
    static let reuseID = "TopTrendingCell"
    private let trendingContainer = UIView()
    private let smallPlayImageView = UIImageView(frame: .zero)
    private let thumbnailImageView = GNThumbnaiImageView(frame: .zero)
    private let moreButton = GNAssertButton(assert: Asserts.more)
    private let titleLabel = GNTitleLabel(fontSize: 20)
    private let artistLabel = GNSecondaryBodyLabel(fontSize: 15, fontColor: UIColor.appColor(.Grey))
    private let numberOfPlaysLabel = GNSecondaryTitleLabel(fontSize: 13, alignment: .left, fontColor: UIColor.appColor(.Grey))
    private let trendingNumberLabel = GNSecondaryTitleLabel(fontSize: 13, alignment: .center, fontColor: .white)
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Methods
extension TopTrendingCell {
    
    func setup(topTrendingSong: TopTrendingSong) {
        thumbnailImageView.image = UIImage(named: topTrendingSong.song.thumbnailUrl)
        trendingNumberLabel.text = "# \(topTrendingSong.rank)"
        titleLabel.text = topTrendingSong.song.title
        artistLabel.text = topTrendingSong.song.artist
        numberOfPlaysLabel.text = "\(topTrendingSong.song.numberOfPlays / 1000000) plays"
    }
    
    
    private func configureUI() {
        let dimensions: CGFloat = 12
        let moreButtonDimensions: CGFloat = 32
        
        trendingContainer.addCornerRadius(of: 12)
        trendingContainer.backgroundColor = UIColor.appColor(.Pretty_Pink)
        smallPlayImageView.image = Asserts.smallPlay
        
        addSubviews(thumbnailImageView, trendingContainer, titleLabel, artistLabel, smallPlayImageView, numberOfPlaysLabel, moreButton)
        trendingContainer.addSubviews(trendingNumberLabel)

        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, size: .init(width: self.frame.height, height: 0))
        trendingContainer.anchor(top: topAnchor, leading: thumbnailImageView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20.7, bottom: 0, right: 0), size: .init(width: 43, height: 24))
        trendingNumberLabel.center(in: trendingContainer, size: .init(width: 40, height: 13))
        titleLabel.anchor(top: trendingContainer.bottomAnchor, leading: trendingContainer.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 176, height: 29))
        artistLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, size: .init(width: 0, height: 21))
        smallPlayImageView.anchor(top: nil, leading: artistLabel.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 3.3, right: 0), size: .init(width: dimensions, height: dimensions))
        numberOfPlaysLabel.anchor(top: nil, leading: smallPlayImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 6, bottom: 2.3, right: 8), size: .init(width: 0, height: 13))
        moreButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, size: .init(width: moreButtonDimensions, height: moreButtonDimensions))
    }
}
