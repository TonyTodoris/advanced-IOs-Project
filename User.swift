//
//  User.swift
//  IOsFinalProject
//
//  Created by Canquery Déborah on 24/01/2019.
//  Copyright © 2019 Epita. All rights reserved.
//

import Foundation
import UIKit

class User {
    var Title: String
    var First: String
    var Last: String
    var Street: String
    var City: String
    var Email: String
    var Phone: String
    var Cell: String
    var LargePictureURL: String
    var smallPictureURL: String
    
    
    init(Title: String, First: String, Last: String, Street: String, City: String, Email: String, Phone: String, Cell: String, LargePictureURL: String, smallPictureURL: String){
        self.Title = Title
        self.First = First
        self.Last = Last
        self.Street = Street
        self.City = City
        self.Email = Email
        self.Phone = Phone
        self.Cell = Cell
        self.LargePictureURL = LargePictureURL
        self.smallPictureURL = smallPictureURL
    }
    
}
