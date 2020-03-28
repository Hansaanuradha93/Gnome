import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}


// MARK: - Fileprivate methods
extension SceneDelegate {
    
    fileprivate func createExploreNC() -> UINavigationController {
        let exploreVC = ExploreVC()
        exploreVC.title = TabBar.explore
        exploreVC.tabBarItem = UITabBarItem(title: TabBar.explore, image: Asserts.explore, tag: 0)
        return UINavigationController(rootViewController: exploreVC)
    }
    
    
    fileprivate func createTrendingNC() -> UINavigationController {
        let trendingVC = TrendingVC()
        trendingVC.title = TabBar.trending
        trendingVC.tabBarItem = UITabBarItem(title: TabBar.trending, image: Asserts.trending, tag: 1)
        return UINavigationController(rootViewController: trendingVC)
    }
    
    
    fileprivate func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = TabBar.search
        searchVC.tabBarItem = UITabBarItem(title: TabBar.search, image: Asserts.search, tag: 2)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    fileprivate func createLibraryNC() -> UINavigationController {
        let libraryVC = LibraryVC()
        libraryVC.title = TabBar.library
        libraryVC.tabBarItem = UITabBarItem(title: TabBar.library, image: Asserts.library, tag: 3)
        return UINavigationController(rootViewController: libraryVC)
    }
    
    
    fileprivate func createSettingsNC() -> UINavigationController {
        let settingsVC = SettingsVC()
        settingsVC.title = TabBar.settings
        settingsVC.tabBarItem = UITabBarItem(title: TabBar.settings, image: Asserts.settings, tag: 4)
        return UINavigationController(rootViewController: settingsVC)
    }
    
    
    fileprivate func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = UIColor.red
        tabBar.viewControllers = [createExploreNC(), createTrendingNC(), createSearchNC(), createLibraryNC(), createSettingsNC()]
        return tabBar
    }
    
    
    fileprivate func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = UIColor.red        
    }
}
