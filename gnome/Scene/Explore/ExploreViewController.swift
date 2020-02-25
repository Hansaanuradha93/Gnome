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
        mainTableView.register(UINib(nibName: String(describing: GetInspiredTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: Storybaord.getInspiredReusableCell)
    }
}


// MARK: - TableView
extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.RecentlyPlayedReusableCell, for: indexPath) as! RecentlyPlayedTableViewCell
            cell.backgroundColor = .red
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.RecommendedForYouReusableCell, for: indexPath) as! RecommendedForYouTableViewCell
            cell.backgroundColor = .blue
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.getInspiredReusableCell, for: indexPath) as! GetInspiredTableViewCell
            cell.backgroundColor = .systemPink
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.RecentlyPlayedReusableCell, for: indexPath) as! RecentlyPlayedTableViewCell
            cell.backgroundColor = .systemTeal
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 185.0
        case 1:
            return 310.0
        case 2:
            return 304.0
        case 3:
            return 185.0
        default:
            return UITableView.automaticDimension
        }
    }
}

