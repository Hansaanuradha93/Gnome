import UIKit

class ExploreVC: UIViewController {

    
    private let titleLabel = GNTitleLabel(fontSize: 34)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewController()
    }
}


// MARK: - Methods
extension ExploreVC {
    
    private func configureViewController() {
        view.backgroundColor    = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func layoutUI() {
        
        view.addSubview(titleLabel)
        titleLabel.text = "Explore"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
}
