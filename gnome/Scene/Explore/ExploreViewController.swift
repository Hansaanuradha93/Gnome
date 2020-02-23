import UIKit

class ExploreViewController: UIViewController {

    // MARK: - Properties
    var viewModel: ExploreViewModel!
    
    
    public class var storyboardName: String {
        return "Explore"
    }
    
    struct Storybaord {
        static let RecentlyPlayedTableViewCell = "RecentlyPlayedTableViewCell"
        static let RecentlyPlayedReusableCell =  "RecentlyPlayedReusableCell"
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
        configureTableView()
        mainTableView.register(UINib(nibName: Storybaord.RecentlyPlayedTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: Storybaord.RecentlyPlayedReusableCell)
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
}


// MARK: - TableView
extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storybaord.RecentlyPlayedReusableCell, for: indexPath) as! RecentlyPlayedTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 3{
            return 182.0
        } else {
            return UITableView.automaticDimension
        }
    }
}

