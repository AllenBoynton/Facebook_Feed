//
//  RequestHeader.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/8/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class RequestHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    // Satisfy error
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "FRIEND REQUESTS"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(white: 0.4, alpha: 1)
        return label
    }()
    
    let bottomBorder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235)
        return view
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(bottomBorder)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: nameLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: bottomBorder)
        addConstraintsWithFormat(format: "V:|[v0][v1(0.5)]|", views: nameLabel, bottomBorder)
    }
}
