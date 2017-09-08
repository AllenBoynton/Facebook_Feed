//
//  CustomTabBarController.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/7/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets the default color of the background of the UITabBar
        UITabBar.appearance().barTintColor = UIColor.white
        
        // Assign view controller
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "News Feed"
        navigationController.tabBarItem.image = UIImage(named: "feed")
        
        let videoController = UIViewController()
        let secondNavigationController = UINavigationController(rootViewController: videoController)
        secondNavigationController.title = "Video"
        secondNavigationController.tabBarItem.image = UIImage(named: "video")
        
        let marketController = UIViewController()
        let thirdNavigationController = UINavigationController(rootViewController: marketController)
        thirdNavigationController.title = "Market"
        thirdNavigationController.tabBarItem.image = UIImage(named: "market")
        
        let notifController = UIViewController()
        let forthNavigationController = UINavigationController(rootViewController: notifController)
        forthNavigationController.title = "Notifications"
        forthNavigationController.tabBarItem.image = UIImage(named: "notification")
        
        let menuController = UIViewController()
        let fifthNavigationController = UINavigationController(rootViewController: menuController)
        fifthNavigationController.title = "Menu"
        fifthNavigationController.tabBarItem.image = UIImage(named: "menu")
        
        viewControllers = [navigationController, secondNavigationController, thirdNavigationController, forthNavigationController, fifthNavigationController]
    }

}
