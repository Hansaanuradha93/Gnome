import UIKit

class ExploreViewController: UIViewController {

    // MARK: - Properties
    var viewModel: ExploreViewModel!
    
    
    public class var storyboardName: String {
        return "Explore"
    }
    
    struct Storybaord {
        static let RecentlyPlayedReusableCell =  "RecentlyPlayedReusableCell"
        static let RecommendedForYouReusableCell = "RecommendedForYouReusableCell"
        static let getInspiredReusableCell = "getInspiredReusableCell"
    }
    
    
    static func create(viewModel: ExploreViewModel) -> ExploreViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ExploreViewController.self)) as? ExploreViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    
    
    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNavigationBar()
    }
}


// MARK: - Fileprivate methods
extension ExploreViewController {
    
    fileprivate func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
