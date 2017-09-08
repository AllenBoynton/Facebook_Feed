//
//  ViewController.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/7/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

// Identifier:
let cellId = "cellId"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var post = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.profileImage = "zuck"
        postMark.statusPost = "Baby cuddles are the best."
        postMark.statusImage = "zuck_feed"
        postMark.numLikes = 400
        postMark.numComments = 123
        postMark.statusImageUrl = "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2017/05/26/104494876-GettyImages-688402250-mark-zuckerberg-harvard.1910x1000.jpg"
        
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.profileImage = "steve"
        postSteve.statusPost = "For the first time ever, Apple will be hosting one of its events in the newly constructed Steve Jobs Theater inside its Apple Park campus in Cupertino. Past Apple events have been held in San Francisco’s Bill Graham Auditorium or its existing Infinity Loop campus a few miles south from the new “spaceship” campus."
        postSteve.statusImage = "steve_feed"
        postSteve.numLikes = 2634
        postSteve.numComments = 142
        postSteve.statusImageUrl = "https://i.kinja-img.com/gawker-media/image/upload/s--IMNV0Op8--/c_scale,fl_progressive,q_80,w_800/17hyh5lm9yhjvjpg.jpg"
        
        let postAllen = Post()
        postAllen.name = "Allen Boynton"
        postAllen.profileImage = "allen"
        postAllen.statusPost = "Today we drove just into North Carolina to Dupont State Forest. We had a great time taking Ryker on his first hike! He absolutely loved it. He was chattering away the entire time. He was being so loud at times I was on the lookout for the black bears and bobcats...Luckily we just saw some birds!"
        postAllen.statusImage = "allen_feed"
        postAllen.numLikes = 162
        postAllen.numComments = 12
        postAllen.statusImageUrl = "https://cdn.eyeem.com/thumb/0128c86af755adf43a19d63f9670e9765a92232a-1486931386099/w/1280?watermark=false"
        
        let postBill = Post()
        postBill.name = "Bill Gates"
        postBill.profileImage = "gates"
        postBill.statusPost = "In sub-Saharan Africa, the malaria death rate has dropped by 50 percent from the disease’s peak in the early 2000s.\n\n" +
        "I don’t throw the word “miracle” around lightly, but that number is nothing short of miraculous!"
        postBill.statusImage = "bill_feed"
        postBill.numLikes = 2265
        postBill.numComments = 212
        postBill.statusImageUrl = "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2016/09/12/103933591-GettyImages-454261842.1910x1000.jpg"
        
        post.append(postMark)
        post.append(postSteve)
        post.append(postAllen)
        post.append(postBill)
        
        // Fix default cache to cache large url images
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapacity = 500 * 1024 * 1024
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "myDiskPath")
        URLCache.shared = urlCache
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.alwaysBounceVertical = true
        
        navigationItem.title = "Facebook Feed"
    }
    
    // Return a collection view cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        customCell.post = post[indexPath.item] // Returns all the elements of the cell post
        
        return customCell
    }
    
    // Implement # of items
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }

    // Create size of cell using CGSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = post[indexPath.item].statusPost {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize:14)], context: nil)
            
            let actualHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44 // From H constraints
            
            return CGSize(width: view.frame.width, height: rect.height + actualHeight + 24)
        }
        
        return CGSize(width: view.frame.width, height: 500)
    }
    
    // Adjusts the view for landscape
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}
