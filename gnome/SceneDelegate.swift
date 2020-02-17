import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        configureNavigationBar()
    }
    
    fileprivate func createExploreNC() -> UINavigationController {
        let exploreVC = ExploreViewController.create(viewModel: ExploreViewModel())
        exploreVC.title = "Explore"
        exploreVC.tabBarItem     = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        return UINavigationController(rootViewController: exploreVC)
    }
    
    
    fileprivate func createTrendingNC() -> UINavigationController {
        let trendingVC             = TrendingViewController.create(viewModel: TrendingViewModel())
        trendingVC.title           = "Trending"
        trendingVC.tabBarItem      = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: trendingVC)
    }
    
    fileprivate func createSearchNC() -> UINavigationController {
        let searchVC             = SearchViewController.create(viewModel: SearchViewModel())
        searchVC.title           = "Search"
        searchVC.tabBarItem      = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    fileprivate func createLibraryNC() -> UINavigationController {
        let libraryVC             = LibraryViewController.create(viewModel: LibraryViewModel())
        libraryVC.title           = "Library"
        libraryVC.tabBarItem      = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 4)
        
        return UINavigationController(rootViewController: libraryVC)
    }
    
    fileprivate func createSettingsNC() -> UINavigationController {
        let settingsVC             = SettingsViewController.create(viewModel: SettingsViewModel())
        settingsVC.title           = "Settings"
        settingsVC.tabBarItem      = UITabBarItem(tabBarSystemItem: .history, tag: 5)
        
        return UINavigationController(rootViewController: settingsVC)
    }
    
    
    fileprivate func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        tabBar.viewControllers = [createExploreNC(), createTrendingNC(), createSearchNC(), createLibraryNC(), createSettingsNC()]
        return tabBar
    }
    
    fileprivate func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

