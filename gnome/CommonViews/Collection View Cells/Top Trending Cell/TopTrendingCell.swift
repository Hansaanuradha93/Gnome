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
//        configureThumbnailImageView()
//        configureTrendingContainer()
//        configureTitleLabel()
//        configureArtistLabel()
//        configureSmallPlayImageView()
//        configureNumberOfPlaysLabel()
//        configureMoreButton()
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
        
        addSubview(thumbnailImageView)
        addSubview(trendingContainer)
        trendingContainer.addSubview(trendingNumberLabel)
        addSubview(titleLabel)
        addSubview(artistLabel)
        addSubview(smallPlayImageView)
        addSubview(numberOfPlaysLabel)
        addSubview(moreButton)

        thumbnailImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, size: .init(width: self.frame.height, height: 0))
        trendingContainer.anchor(top: topAnchor, leading: thumbnailImageView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 20.7, bottom: 0, right: 0), size: .init(width: 43, height: 24))
        trendingNumberLabel.center(in: trendingContainer, size: .init(width: 40, height: 13))
        titleLabel.anchor(top: trendingContainer.bottomAnchor, leading: trendingContainer.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0), size: .init(width: 176, height: 29))
        artistLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, size: .init(width: 0, height: 21))
        smallPlayImageView.anchor(top: nil, leading: artistLabel.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 3.3, right: 0), size: .init(width: dimensions, height: dimensions))
        numberOfPlaysLabel.anchor(top: nil, leading: smallPlayImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 6, bottom: 2.3, right: 8), size: .init(width: 0, height: 13))
        moreButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, size: .init(width: moreButtonDimensions, height: moreButtonDimensions))
    }
    
    
//    private func configureThumbnailImageView() {
//        addSubview(thumbnailImageView)
//
//        NSLayoutConstraint.activate([
//            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
//            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor)
//        ])
//    }
    
    
//    private func configureTrendingContainer() {
//        addSubview(trendingContainer)
//
//        trendingContainer.translatesAutoresizingMaskIntoConstraints = false
//        trendingContainer.addCornerRadius(of: 12)
//        trendingContainer.backgroundColor = UIColor.appColor(.Pretty_Pink)
//        trendingContainer.addSubview(trendingNumberLabel)
//
//        NSLayoutConstraint.activate([
//            trendingContainer.topAnchor.constraint(equalTo: topAnchor),
//            trendingContainer.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 20.7),
//            trendingContainer.widthAnchor.constraint(equalToConstant: 43),
//            trendingContainer.heightAnchor.constraint(equalToConstant: 24),
//
//            trendingNumberLabel.centerXAnchor.constraint(equalTo: trendingContainer.centerXAnchor),
//            trendingNumberLabel.centerYAnchor.constraint(equalTo: trendingContainer.centerYAnchor),
//            trendingNumberLabel.widthAnchor.constraint(equalToConstant: 40),
//            trendingNumberLabel.heightAnchor.constraint(equalToConstant: 13)
//        ])
//    }
    
    
//    private func configureTitleLabel() {
//        addSubview(titleLabel)
//
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: trendingContainer.bottomAnchor, constant: 4),
//            titleLabel.leadingAnchor.constraint(equalTo: trendingContainer.leadingAnchor),
//            titleLabel.widthAnchor.constraint(equalToConstant: 176),
//            titleLabel.heightAnchor.constraint(equalToConstant: 29)
//        ])
//    }
    
    
//    private func configureArtistLabel() {
//        addSubview(artistLabel)
//
//        NSLayoutConstraint.activate([
//            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            artistLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            artistLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            artistLabel.heightAnchor.constraint(equalToConstant: 21)
//        ])
//    }
    
    
//    private func configureSmallPlayImageView() {
//        addSubview(smallPlayImageView)
//        smallPlayImageView.translatesAutoresizingMaskIntoConstraints = false
//        smallPlayImageView.image = Asserts.smallPlay
//
//        NSLayoutConstraint.activate([
//            smallPlayImageView.leadingAnchor.constraint(equalTo: artistLabel.leadingAnchor),
//            smallPlayImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3.3),
//            smallPlayImageView.widthAnchor.constraint(equalToConstant: 12),
//            smallPlayImageView.heightAnchor.constraint(equalToConstant: 12)
//        ])
//    }
    
    
//    private func configureNumberOfPlaysLabel() {
//        addSubview(numberOfPlaysLabel)
//
//        NSLayoutConstraint.activate([
//            numberOfPlaysLabel.leadingAnchor.constraint(equalTo: smallPlayImageView.trailingAnchor, constant: 6),
//            numberOfPlaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
//            numberOfPlaysLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.3),
//            numberOfPlaysLabel.heightAnchor.constraint(equalToConstant: 13)
//        ])
//    }
//
//
//    private func configureMoreButton() {
//        addSubview(moreButton)
//
//        NSLayoutConstraint.activate([
//            moreButton.topAnchor.constraint(equalTo: topAnchor),
//            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
//            moreButton.widthAnchor.constraint(equalToConstant: 32),
//            moreButton.heightAnchor.constraint(equalToConstant: 32)
//        ])
//    }
}
