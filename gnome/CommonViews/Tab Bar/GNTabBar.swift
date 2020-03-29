import UIKit

class GNTabBar: UITabBarController {

    // MARK: - View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.appColor(.Pretty_Pink)
        viewControllers                 = [createExploreNC(), createTrendingNC(), createSearchNC(), createLibraryNC(), createSettingsNC()]
    }
}


// MARK: - Methods
extension GNTabBar {
    
    private func createExploreNC() -> UINavigationController {
        let exploreVC = ExploreVC()
        exploreVC.title = Titles.explore
        exploreVC.tabBarItem = UITabBarItem(title: Titles.explore, image: Asserts.explore, tag: 0)
        return UINavigationController(rootViewController: exploreVC)
    }
    
    
    private func createTrendingNC() -> UINavigationController {
        let trendingVC = TrendingVC()
        trendingVC.title = Titles.trending
        trendingVC.tabBarItem = UITabBarItem(title: Titles.trending, image: Asserts.trending, tag: 1)
        return UINavigationController(rootViewController: trendingVC)
    }
    
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = Titles.search
        searchVC.tabBarItem = UITabBarItem(title: Titles.search, image: Asserts.search, tag: 2)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    private func createLibraryNC() -> UINavigationController {
        let libraryVC = LibraryVC()
        libraryVC.title = Titles.library
        libraryVC.tabBarItem = UITabBarItem(title: Titles.library, image: Asserts.library, tag: 3)
        return UINavigationController(rootViewController: libraryVC)
    }
    
    
    private func createSettingsNC() -> UINavigationController {
        let settingsVC = SettingsVC()
        settingsVC.title = Titles.settings
        settingsVC.tabBarItem = UITabBarItem(title: Titles.settings, image: Asserts.settings, tag: 4)
        return UINavigationController(rootViewController: settingsVC)
    }
}

