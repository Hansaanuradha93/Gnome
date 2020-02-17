import UIKit

class TrendingViewController: UIViewController {

    var viewModel: TrendingViewModel!
    
    
    public class var storyboardName: String {
        return "Trending"
    }
    
    static func create(viewModel: TrendingViewModel) -> TrendingViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: TrendingViewController.self)) as? TrendingViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
