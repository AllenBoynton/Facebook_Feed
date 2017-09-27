//
//  CollectionViewCell.swift
//  facebookFeed
//
//  Created by Allen Boynton on 9/7/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // VC Delegate
    var feedController: FeedController?
    
    func animate() {
        feedController?.animateImageView(statusImageView: statusImageView)
    }
    
    var post: Post? {
        didSet {
            
            if let statusImageUrl = post?.statusImageUrl {
                URLSession.shared.dataTask(with: NSURL(string: statusImageUrl)! as URL, completionHandler: { (data, response, error) -> Void in
                    if error != nil {
                        print(error.debugDescription)
                        return
                    }
                    
                    let image = UIImage(data: data!)
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.statusImageView.image = image
                    })
                }).resume()
                
            } else {
                if let statusImage = post?.statusImage {
                    statusImageView.image = UIImage(named: statusImage)
                }
            }
            
            setupNameStatusProfileLocation()
        }
    }
    
    private func setupNameStatusProfileLocation() {
        if let name = post?.name {
            // Creates first line
            let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttachmentAttributeName: UIFont.boldSystemFont(ofSize: 14)])
            
            attributedText.append(NSAttributedString(string: "\nAugust 7 at 3:29pm  •  San Francisco  •  ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.rgb(red: 155, green: 161, blue: 171)]))
            
            // Gives two lines its pattern
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
            
            // Adds image at end of text
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "globe_small")
            attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
            attributedText.append(NSAttributedString(attachment: attachment))
            
            nameLabel.attributedText = attributedText
        }
        
        if let profileImage = post?.profileImage {
            profileImageView.image = UIImage(named: profileImage)
        }
        
        if let statusText = post?.statusPost {
            statusTextView.text = statusText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    // Create custom label
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let optionsButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        
        button.setImage(UIImage(named: "dots"), for: .normal)
        return button
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false // Turn off scroll of post text
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let likesCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "488 Likes   10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = FeedCell.buttonsForTitle(title: "Like", imageName: "like")
    let commentButton = FeedCell.buttonsForTitle(title: "Comment", imageName: "comment")
    let shareButton = FeedCell.buttonsForTitle(title: "Share", imageName: "share")
    
    static func buttonsForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0) // Set insets
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }
    
    // Add subviews w constraints
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(optionsButton)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentLabel)
        addSubview(dividerLineView)
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        statusImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FeedCell.animate as (FeedCell) -> () -> ())))
        
        // Add Horizontal constraints using extension UIView
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1][v2(30)]-8-|", views: profileImageView, nameLabel, optionsButton)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentLabel)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        
        addConstraintsWithFormat(format: "H:|[v0(v1)][v1(v2)][v2]|", views: likeButton, commentButton, shareButton)
        
        // Add Vertical constraints using extension UIView
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:|-8-[v0]", views: optionsButton)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1][v2(200)]-8-[v3(24)]-8-[v4(0.5)][v5(42)]|", views: profileImageView, statusTextView, statusImageView, likesCommentLabel, dividerLineView, likeButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

