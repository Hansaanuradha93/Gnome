import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = GNTabBar()
        window?.makeKeyAndVisible()
        configureNavigationBar()
    }
}


// MARK: - Methods
extension SceneDelegate {
    func configureNavigationBar() { UINavigationBar.appearance().tintColor = UIColor.appColor(.Pretty_Pink) }
}
