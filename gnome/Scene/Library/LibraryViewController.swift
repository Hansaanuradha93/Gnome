import UIKit

class LibraryViewController: UIViewController {

    var viewModel: LibraryViewModel!
    
    
    public class var storyboardName: String {
        return "Library"
    }
    
    static func create(viewModel: LibraryViewModel) -> LibraryViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: LibraryViewController.self)) as? LibraryViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
