import UIKit

class ExploreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let test = GNThumbnaiImageView(frame: .zero)
        view.addSubview(test)
        
        NSLayoutConstraint.activate([
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            test.widthAnchor.constraint(equalToConstant: 115),
            test.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
}
