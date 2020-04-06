import UIKit

class TopTrendingCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "TopTrendingCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let trendingContainer   = UIView()
    private let trendingNumberLabel = GNSecondaryTitleLabel(fontSize: 13, alignment: .center, fontColor: .white)
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureThumbnailImageView()
        configureTrendingContainer()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    // MARK: - Methods
    private func configureThumbnailImageView() {
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor)
        ])
    }
    
    
    private func configureTrendingContainer() {
        
        addSubview(trendingContainer)
        trendingContainer.translatesAutoresizingMaskIntoConstraints = false
        trendingContainer.addCornerRadius(of: 12)
        trendingContainer.backgroundColor   = UIColor.appColor(.Pretty_Pink)

        
        trendingContainer.addSubview(trendingNumberLabel)
        trendingNumberLabel.text            = "# 1"
        
        NSLayoutConstraint.activate([
            trendingContainer.topAnchor.constraint(equalTo: topAnchor),
            trendingContainer.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 20.7),
            trendingContainer.widthAnchor.constraint(equalToConstant: 43),
            trendingContainer.heightAnchor.constraint(equalToConstant: 24),
            
            trendingNumberLabel.centerXAnchor.constraint(equalTo: trendingContainer.centerXAnchor),
            trendingNumberLabel.centerYAnchor.constraint(equalTo: trendingContainer.centerYAnchor),
            trendingNumberLabel.widthAnchor.constraint(equalToConstant: 18),
            trendingNumberLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
}
