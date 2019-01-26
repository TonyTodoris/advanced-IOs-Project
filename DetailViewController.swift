//
//  DetailViewController.swift
//  IOsFinalProject
//
//  Created by Canquery Déborah on 25/01/2019.
//  Copyright © 2019 Epita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cell: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Street: UILabel!
    @IBOutlet weak var Last: UILabel!
    @IBOutlet weak var Titre: UILabel!
    @IBOutlet weak var First: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        if let user = user{
            let url = URL(string: user.LargePictureURL)
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                imageView.image = image
            }
            
            Last.text = user.Last
            Titre.text = user.Title
            First.text = user.First
            City.text = user.City
            Street.text = user.Street
            email.text = user.Email
            phone.text = user.Phone
            cell.text = user.Cell
        }
    }
    

}
