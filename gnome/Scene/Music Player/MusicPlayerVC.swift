import UIKit

class MusicPlayerVC: UIViewController {

    private let viewModel = MusicPlayerVM()
    private let collapseButton = GNAssertButton(assert: Asserts.collapse)
    private let optionButton = GNAssertButton(assert: Asserts.option)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureViewController()
    }
}


// MARK: - Methods
extension MusicPlayerVC {
    
    private func configureViewController() {
        
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func configureButtons() {
        
        view.addSubview(collapseButton)
        view.addSubview(optionButton)
        
        optionButton.alpha = 0.5
        
        NSLayoutConstraint.activate([
            collapseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 69),
            collapseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            collapseButton.widthAnchor.constraint(equalToConstant: 16.98),
            collapseButton.heightAnchor.constraint(equalToConstant: 10.48),
            
            optionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            optionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
            optionButton.widthAnchor.constraint(equalToConstant: 16),
            optionButton.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}
