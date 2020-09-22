import UIKit

class TrendingVC: UIViewController {

    // MARK: Properties
    private let viewModel = TrendingVM()
    
    private let titleLabel = GNTitleLabel(fontSize: 34)
    private let topTrendingTitleLabel = GNTitleLabel(fontSize: 22)
    private let genresContainer = UIView()
    private let topTrendingContainer = UIView()
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}


// MARK: - Methods
extension TrendingVC {
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        titleLabel.text = Titles.trending
        topTrendingTitleLabel.text = Titles.topTrending
        
        view.addSubviews(titleLabel, genresContainer, topTrendingTitleLabel, topTrendingContainer)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 23, left: 16, bottom: 16, right: 0), size: .init(width: 0, height: 44))
        genresContainer.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        topTrendingTitleLabel.anchor(top: genresContainer.bottomAnchor, leading: genresContainer.leadingAnchor, bottom: nil, trailing: genresContainer.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 32))
        topTrendingContainer.anchor(top: topTrendingTitleLabel.bottomAnchor, leading: topTrendingTitleLabel.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: topTrendingTitleLabel.trailingAnchor, padding: .init(top: 14, left: 0, bottom: 0, right: 0))
        
        add(childVC: HorizontalCollectionViewVC(), to: genresContainer)
        add(childVC: TopTrendingVC(), to: topTrendingContainer)
    }
    
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        self.addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
