import UIKit

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel!
    
    
    public class var storyboardName: String {
        return "Search"
    }
    
    static func create(viewModel: SearchViewModel) -> SearchViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: SearchViewController.self)) as? SearchViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
