//
//  InfoViewCell.swift
//  IOsFinalProject
//
//  Created by Canquery Déborah on 24/01/2019.
//  Copyright © 2019 Epita. All rights reserved.
//

import Foundation
import UIKit

class InfoViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
    func load(_ user: User){
        fullname.text = user.First + " " + user.Last
        email.text = user.Email
        
        let url = URL(string: user.smallPictureURL)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            picture.image = image
            picture.layer.cornerRadius = picture.frame.height/2
        }
        
    }
    
}
