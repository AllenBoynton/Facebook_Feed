//
//  Posts.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/7/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import Foundation

class Post {
    
    var name: String?
    var profileImage: String?
    var statusPost: String?
    var statusImage: String?
//    var statusTimeStamp: String?
    
    var numLikes: Int?
    var numComments: Int?
    
    var statusImageUrl: String?
}

//class Posts {
//    
//    private let postsList: [Post]
//    
//    init() {
//        let postMark = Post()
//        postMark.name = "Mark Zuckerberg"
//        postMark.profileImage = "zuck"
//        postMark.statusPost = "Baby cuddles are the best."
//        postMark.statusImage = "zuck_feed"
//        postMark.numLikes = 400
//        postMark.numComments = 123
//        postMark.statusImageUrl = "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2017/05/26/104494876-GettyImages-688402250-mark-zuckerberg-harvard.1910x1000.jpg"
//        
//        let postSteve = Post()
//        postSteve.name = "Steve Jobs"
//        postSteve.profileImage = "steve"
//        postSteve.statusPost = "For the first time ever, Apple will be hosting one of its events in the newly constructed Steve Jobs Theater inside its Apple Park campus in Cupertino. Past Apple events have been held in San Francisco’s Bill Graham Auditorium or its existing Infinity Loop campus a few miles south from the new “spaceship” campus."
//        postSteve.statusImage = "steve_feed"
//        postSteve.numLikes = 2634
//        postSteve.numComments = 142
//        postSteve.statusImageUrl = "https://i.kinja-img.com/gawker-media/image/upload/s--IMNV0Op8--/c_scale,fl_progressive,q_80,w_800/17hyh5lm9yhjvjpg.jpg"
//        
//        let postAllen = Post()
//        postAllen.name = "Allen Boynton"
//        postAllen.profileImage = "allen"
//        postAllen.statusPost = "Today we drove just into North Carolina to Dupont State Forest. We had a great time taking Ryker on his first hike! He absolutely loved it. He was chattering away the entire time. He was being so loud at times I was on the lookout for the black bears and bobcats...Luckily we just saw some birds!"
//        postAllen.statusImage = "allen_feed"
//        postAllen.numLikes = 162
//        postAllen.numComments = 12
//        postAllen.statusImageUrl = "https://cdn.eyeem.com/thumb/0128c86af755adf43a19d63f9670e9765a92232a-1486931386099/w/1280?watermark=false"
//        
//        let postBill = Post()
//        postBill.name = "Bill Gates"
//        postBill.profileImage = "gates"
//        postBill.statusPost = "In sub-Saharan Africa, the malaria death rate has dropped by 50 percent from the disease’s peak in the early 2000s.\n\n" +
//        "I don’t throw the word “miracle” around lightly, but that number is nothing short of miraculous: http://b-gat.es/2wqFzVq"
//        postBill.statusImage = "bill_feed"
//        postBill.numLikes = 2265
//        postBill.numComments = 212
//        postBill.statusImageUrl = "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2016/09/12/103933591-GettyImages-454261842.1910x1000.jpg"
//        
//        self.postsList.append(postMark)
//        self.postsList.append(postSteve)
//        self.postsList.append(postAllen)
//        self.postsList.append(postBill)
//    }
//}
