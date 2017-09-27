//
//  FriendRequestCell.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/8/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class FriendRequestCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Name"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.blue
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: UIControlState())
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.backgroundColor = UIColor.rgb(red: 87, green: 143, blue: 255)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.layer.cornerRadius = 2
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: UIControlState())
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: UIControlState())
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return button
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        addConstraintsWithFormat(format: "H:|-16-[v0(52)]-8-[v1]", views: profileImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-|", views: profileImageView)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1(24)]-8-|", views: nameLabel, confirmButton)
        
        addConstraintsWithFormat(format: "H:|-76-[v0(80)]-8-[v1(80)]", views: confirmButton, deleteButton)
        addConstraintsWithFormat(format: "V:[v0(24)]-8-|", views: deleteButton)
    }
}
