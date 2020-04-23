import UIKit

class ExpanVC: UIViewController {

    private let viewModel = ExploreVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension ExpanVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
