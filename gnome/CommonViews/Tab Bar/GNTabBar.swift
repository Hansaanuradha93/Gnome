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
        exploreVC.title = TabBar.explore
        exploreVC.tabBarItem = UITabBarItem(title: TabBar.explore, image: Asserts.explore, tag: 0)
        return UINavigationController(rootViewController: exploreVC)
    }
    
    
    private func createTrendingNC() -> UINavigationController {
        let trendingVC = TrendingVC()
        trendingVC.title = TabBar.trending
        trendingVC.tabBarItem = UITabBarItem(title: TabBar.trending, image: Asserts.trending, tag: 1)
        return UINavigationController(rootViewController: trendingVC)
    }
    
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = TabBar.search
        searchVC.tabBarItem = UITabBarItem(title: TabBar.search, image: Asserts.search, tag: 2)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    private func createLibraryNC() -> UINavigationController {
        let libraryVC = LibraryVC()
        libraryVC.title = TabBar.library
        libraryVC.tabBarItem = UITabBarItem(title: TabBar.library, image: Asserts.library, tag: 3)
        return UINavigationController(rootViewController: libraryVC)
    }
    
    
    private func createSettingsNC() -> UINavigationController {
        let settingsVC = SettingsVC()
        settingsVC.title = TabBar.settings
        settingsVC.tabBarItem = UITabBarItem(title: TabBar.settings, image: Asserts.settings, tag: 4)
        return UINavigationController(rootViewController: settingsVC)
    }
}

