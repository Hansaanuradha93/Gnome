import UIKit

class SettingsViewController: UIViewController {

    var viewModel: SettingsViewModel!
    
    
    public class var storyboardName: String {
        return "Settings"
    }
    
    static func create(viewModel: SettingsViewModel) -> SettingsViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: SettingsViewController.self)) as? SettingsViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
