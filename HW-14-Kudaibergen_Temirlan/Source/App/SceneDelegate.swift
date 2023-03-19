//
//  SceneDelegate.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 15.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarController = TabBarController()
        let navigationController = UINavigationController(rootViewController: tabBarController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

