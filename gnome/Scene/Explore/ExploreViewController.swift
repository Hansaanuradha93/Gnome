import UIKit

class ExploreViewController: UIViewController {

    var viewModel: ExploreViewModel!
    
    
    public class var storyboardName: String {
        return "Explore"
    }
    
    static func create(viewModel: ExploreViewModel) -> ExploreViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ExploreViewController.self)) as? ExploreViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
