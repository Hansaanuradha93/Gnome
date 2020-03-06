import UIKit

class ExploreRewampViewController: UIViewController {

    // MARK: - Properties
    var viewModel: ExploreRewampViewModel!
    
    
    public class var storyboardName: String {
        return "Explore"
    }
    
    static func create(viewModel: ExploreRewampViewModel) -> ExploreRewampViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ExploreRewampViewController.self)) as? ExploreRewampViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    
    // MARK: - IBLoutlets
    
    
    

    // MARK: - View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
}

// MARK: - Fileprivate methods
extension ExploreRewampViewController {
    
}
