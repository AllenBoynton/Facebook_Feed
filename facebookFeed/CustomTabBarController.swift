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
        tabBar.isTranslucent = false
        
        // Assign view controller
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "News Feed"
        navigationController.tabBarItem.image = UIImage(named: "feed")
        
        let friendRequestsController = FriendRequestsController()
        let secondNavigationController = UINavigationController(rootViewController: friendRequestsController)
        secondNavigationController.title = "Requests"
        secondNavigationController.tabBarItem.image = UIImage(named: "requests_icon")
        
        let messengerController = MessengerController()
        let thirdNavigationController = UINavigationController(rootViewController: messengerController)
        thirdNavigationController.title = "Messenger"
        thirdNavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        
        let notifController = NotifController()
        let forthNavigationController = UINavigationController(rootViewController: notifController)
        forthNavigationController.title = "Notifications"
        forthNavigationController.tabBarItem.image = UIImage(named: "globe_small")
        
        let menuController = MenuController()
        let fifthNavigationController = UINavigationController(rootViewController: menuController)
        fifthNavigationController.title = "More"
        fifthNavigationController.tabBarItem.image = UIImage(named: "more_icon")
        
        viewControllers = [navigationController, secondNavigationController, thirdNavigationController, forthNavigationController, fifthNavigationController]
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
}
