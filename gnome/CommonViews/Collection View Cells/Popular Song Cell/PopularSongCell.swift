import UIKit

class PopularSongCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID              = "PopularSongCell"
    private let thumbnailImageView  = GNThumbnaiImageView(frame: .zero)
    private let titleLabel          = GNTitleLabel(fontSize: 20)
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureThumbnailImageView()
        configureTitleLabel()
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
}
