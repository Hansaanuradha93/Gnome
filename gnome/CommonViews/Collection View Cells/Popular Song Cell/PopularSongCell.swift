import UIKit

class PopularSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "PopularSongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let titleLabel          = GNTitleLabel(fontSize: 20)
    private let numberOfPlaysLabel  = GNSecondaryBodyLabel(fontSize: 15, fontColor: UIColor.appColor(.Grey))
    private let moreButton          = GNAssertButton(assert: Asserts.more)
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureThumbnailImageView()
        configureTitleLabel()
        configureNumberOfPlaysLabel()
        configureMoreButton()
        backgroundColor = .red
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Methods
extension PopularSongCell {
    
    private func configureThumbnailImageView() {
        
        thumbnailImageView.image = UIImage(named: Temporary.song1)
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            thumbnailImageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    
    private func configureTitleLabel() {
        
        titleLabel.text = "Title"
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    
    private func configureNumberOfPlaysLabel() {
        
        numberOfPlaysLabel.text = "1.6M plays"
        addSubview(numberOfPlaysLabel)
        
        NSLayoutConstraint.activate([
            numberOfPlaysLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            numberOfPlaysLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            numberOfPlaysLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    
    private func configureMoreButton() {
        
        let dimensions: CGFloat = 32
        addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            moreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreButton.widthAnchor.constraint(equalToConstant: dimensions),
            moreButton.heightAnchor.constraint(equalToConstant: dimensions)
        
        ])
    }
}
