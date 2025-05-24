//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        configureKeychainOnFirstLaunch()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = LoginView(viewModel: LoginViewModel())
        window?.makeKeyAndVisible()
    }
    
    func switchRootVCToTabView() {
        guard let currentWindow = self.window else { return }
        guard let windowScene = currentWindow.windowScene else { return }

        let newWindow = UIWindow(windowScene: windowScene)
        newWindow.rootViewController = TabView()
        newWindow.makeKeyAndVisible()
        
        self.window = newWindow
        currentWindow.isHidden = true
    }

    
    func switchRootVCToLoginView() {
        guard let currentWindow = self.window else { return }
        guard let windowScene = currentWindow.windowScene else { return }

        let newWindow = UIWindow(windowScene: windowScene)
        let viewModel = LoginViewModel()
        newWindow.rootViewController = LoginView(viewModel: viewModel)
        newWindow.makeKeyAndVisible()
        
        self.window = newWindow
        currentWindow.isHidden = true
    }

    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


    func configureKeychainOnFirstLaunch() {
        let hasInitializedKeychain = UserDefaults.standard.bool(forKey: "hasInitializedKeychain")

        if !hasInitializedKeychain {
            KeychainManager.shared.save("1234", key: "login")
            KeychainManager.shared.save("1234", key: "password")

            UserDefaults.standard.set(true, forKey: "hasInitializedKeychain")
            UserDefaults.standard.synchronize()

            print("Keychain initialized with default values")
        } else {
            print("Keychain already initialized")
        }
    }
}

