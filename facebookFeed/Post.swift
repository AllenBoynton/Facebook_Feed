//
//  Posts.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/7/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import Foundation

class Post: SafeJsonObject {
    
    var location: Location?
    
    var name: String?
    var profileImage: String?
    var statusPost: String?
    var statusImage: String?
    
    var numLikes: Int?
    var numComments: Int?
    
    var statusImageUrl: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "location" {
            location = Location()
            location?.setValuesForKeys(value as! [String: Any])
        } else {
            super.setValue(value, forKey: key)
        }
    }
}

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let selectorString = "set\(key.uppercased().characters.first!)\(String(key.characters.dropFirst())):"
        let selector = Selector(selectorString)
        if responds(to: selector) {
            super.setValue(value, forKey: key)
        }
    }
}
