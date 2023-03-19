//
//  TabBarController.swift
//  HW-14-Kudaibergen_Temirlan
//
//  Created by Темирлан Кудайберген on 18.03.2023.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate
{
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
        setupAlbumsBar()
    }
    
    func setupAlbumsBar() {
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setLeftBarButton(UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "plus"),
            primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
            menu: nil), animated: true)
    }

    // MARK: - TabBar Configuration
    
    func setupTabBarController() {
        view.backgroundColor = .white
        tabBar.tintColor = .lightGray
        tabBar.selectedImageTintColor = UIColor.systemBlue
    }
    
    func setupTabBarViewControllers() {
        
        let firstViewController = OtherViewControllers()
        let firstIcon = UITabBarItem(title: "Медиатека",
                                     image: UIImage(systemName: "rectangle.fill.badge.person.crop"),
                                     selectedImage: UIImage(systemName: "rectangle.fill.badge.person.crop"))
        firstViewController.tabBarItem = firstIcon
        
        let secondViewController = OtherViewControllers()
        let secondIcon = UITabBarItem(title: "Для Вас",
                                      image: UIImage(systemName: "heart.text.square.fill"),
                                      selectedImage: UIImage(systemName: "heart.text.square.fill"))
        secondViewController.tabBarItem = secondIcon
        
        let albumsViewController = Albums()
        let albumsIcon = UITabBarItem(title: "Альбомы",
                                      image: UIImage(systemName: "square.stack.fill"),
                                      selectedImage: UIImage(systemName: "square.stack.fill"))
        albumsViewController.tabBarItem = albumsIcon
        
        let fourthViewController = OtherViewControllers()
        let fourthIcon = UITabBarItem(title: "Поиск",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      selectedImage: UIImage(systemName: "magnifyingglass"))
        fourthViewController.tabBarItem = fourthIcon
        
        let controllers = [firstViewController, secondViewController, albumsViewController, fourthViewController]
        self.setViewControllers(controllers, animated: true)
    }
    
    func tabBarController(_tabBarContoller: UITabBarController, shouldSelect viewController: UIViewController)-> Bool{
        return true
    }
}
