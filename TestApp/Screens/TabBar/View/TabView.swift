import UIKit

class TabView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(CustomTabBar(), forKey: "tabBar")
        setupTabs()
        setupTabBar()
    }
}

//MARK: - Tab Setup

extension TabView {
    func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.1490196078, green: 0.1529411765, blue: 0.2352941176, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8078431373, green: 0.8156862745, blue: 0.8705882353, alpha: 1)
    }
    
    func setupTabs() {
        let homeViewModel = HomeViewModel()
        let homeView = createTabForHomeView(image: .homeIcon, view: HomeView(viewModel: homeViewModel))
        let statisticView = createTabForEmptyVC(image: .statisticIcon, vc: UIViewController(), backgroundColor: .red)
        let walletView = createTabForEmptyVC(image: .walletIcon, vc: UIViewController(), backgroundColor: .green)
        let checkView = createTabForEmptyVC(image: .checkIcon, vc: UIViewController(), backgroundColor: .blue)
        let profileView = createTabForEmptyVC(image: .profileIcon, vc: UIViewController(), backgroundColor: .yellow)
        
        setViewControllers([homeView, statisticView, walletView, checkView, profileView], animated: true)
    }
    
    func createTabForHomeView(image: UIImage, view: HomeView) -> UINavigationController{
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.navigationBar.isHidden = true
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        return navigationController
    }
    
    ///Заглушка
    func createTabForEmptyVC(image: UIImage, vc: UIViewController, backgroundColor: UIColor) -> UIViewController{
        vc.tabBarItem.image = image
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
        return vc
    }
}
