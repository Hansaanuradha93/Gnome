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
        registerCells()
        configureTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNavigationBar()
    }
}


// MARK: - Fileprivate methods
extension ExploreViewController {
    
    fileprivate func configureTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    
    fileprivate func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    fileprivate func registerCells() {
        mainTableView.register(UINib(nibName: String(describing: RecentlyPlayedTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Storybaord.RecentlyPlayedReusableCell)
        mainTableView.register(UINib(nibName: String(describing: RecommendedForYouTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Storybaord.RecommendedForYouReusableCell)
    }
}


// MARK: - TableView
extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.RecentlyPlayedReusableCell, for: indexPath) as! RecentlyPlayedTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.RecommendedForYouReusableCell, for: indexPath) as! RecommendedForYouTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 3{
            return 185.0
        } else {
            return UITableView.automaticDimension
        }
    }
}

