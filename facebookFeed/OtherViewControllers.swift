//
//  OtherViewControllers.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/8/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class FriendRequestsController: UITableViewController {
    
    static let cellId = "cellId"
    static let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar attributes
        navigationItem.title = "Friend Requests"
        
        tableView.separatorColor = UIColor.rgb(red: 229, green: 231, blue: 235)
        tableView.sectionHeaderHeight = 26
        
        tableView.register(FriendRequestCell.self, forCellReuseIdentifier: FriendRequestsController.cellId)
        tableView.register(RequestHeader.self, forHeaderFooterViewReuseIdentifier: FriendRequestsController.headerId)
    }
    
    // Table view # of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Set statically for aesthetics
    }
    
    // Data for static cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendRequestsController.cellId, for: indexPath) as! FriendRequestCell
        
        if indexPath.row % 3 == 0 {
            cell.nameLabel.text = "Mark Zuckerberg"
            cell.profileImageView.image = UIImage(named: "zuck")
        } else if indexPath.row % 3 == 1 {
            cell.nameLabel.text = "Mahatma Gandhi"
            cell.profileImageView.image = UIImage(named: "gandhi")
        } else {
            cell.nameLabel.text = "Steve Jobs"
            cell.profileImageView.image = UIImage(named: "steve")
        }
        
        cell.imageView?.backgroundColor = UIColor.black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendRequestsController.headerId) as! RequestHeader
        
        if section == 0 {
            header.nameLabel.text = "FRIEND REQUESTS"
        } else {
            header.nameLabel.text = "PEOPLE YOU MAY NOT KNOW"
        }
        
        return header
    }
}

class MessengerController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar attributes
        navigationItem.title = "Marketplace"
        view.backgroundColor = UIColor.white
    }
}

class NotifController: UIViewController {
    
}

class MenuController: UIViewController {
    
}
