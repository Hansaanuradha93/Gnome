import UIKit

class TrendingVC: UIViewController {

    private var viewModel               = TrendingVM()
    private let titleLabel              = GNTitleLabel(fontSize: 34)
    private let genresContainer         = UIView()
    private let topTrendingContainer    = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTitleLabel()
        configureGenresContainer()
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
            genresContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genresContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            genresContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func configureTopTrendingContainer() {
        
        view.addSubview(topTrendingContainer)
        topTrendingContainer.translatesAutoresizingMaskIntoConstraints = false
        topTrendingContainer.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            topTrendingContainer.topAnchor.constraint(equalTo: genresContainer.bottomAnchor, constant: 30),
            topTrendingContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topTrendingContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
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
    }
}
