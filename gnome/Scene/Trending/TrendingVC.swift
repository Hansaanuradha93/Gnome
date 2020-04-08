import UIKit

class TrendingVC: UIViewController {

    private let viewModel               = TrendingVM()
    private let titleLabel              = GNTitleLabel(fontSize: 34)
    private let topTrendingTitleLabel   = GNTitleLabel(fontSize: 22)
    private let genresContainer         = UIView()
    private let topTrendingContainer    = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTitleLabel()
        configureGenresContainer()
        configureTopTrendingTitleLabel()
        configureTopTrendingContainer()
        configureUIElements()
    }
}


// MARK: - Methods
extension TrendingVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureTitleLabel() {
        
        view.addSubview(titleLabel)
        titleLabel.text = Titles.trending
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    private func configureGenresContainer() {
        
        view.addSubview(genresContainer)
        genresContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genresContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            genresContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            genresContainer.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            genresContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func configureTopTrendingTitleLabel() {
        
        view.addSubview(topTrendingTitleLabel)
        topTrendingTitleLabel.text = Titles.topTrending
        
        NSLayoutConstraint.activate([
            topTrendingTitleLabel.topAnchor.constraint(equalTo: genresContainer.bottomAnchor, constant: 30),
            topTrendingTitleLabel.leadingAnchor.constraint(equalTo: genresContainer.leadingAnchor),
            topTrendingTitleLabel.trailingAnchor.constraint(equalTo: genresContainer.trailingAnchor),
            topTrendingTitleLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    
    private func configureTopTrendingContainer() {
        
        view.addSubview(topTrendingContainer)
        topTrendingContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topTrendingContainer.topAnchor.constraint(equalTo: topTrendingTitleLabel.bottomAnchor, constant: 14),
            topTrendingContainer.leadingAnchor.constraint(equalTo: topTrendingTitleLabel.leadingAnchor),
            topTrendingContainer.trailingAnchor.constraint(equalTo: topTrendingTitleLabel.trailingAnchor),
            topTrendingContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        
        self.addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    private func configureUIElements() {
        
        add(childVC: HorizontalCollectionViewVC(), to: genresContainer)
        add(childVC: TopTrendingVC(), to: topTrendingContainer)
    }
}
