//
//  ViewController.swift
//  IOsFinalProject
//
//  Created by Canquery Déborah on 24/01/2019.
//  Copyright © 2019 Epita. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users: [User] = []
    
    @IBOutlet weak var tableView: UITableView!
    let list = ["Antonis", "Nadia", "Takis", "Katia", "Malika"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContent()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InfoViewCell
        
        if((indexPath.item % 2) == 0 ){
            cell.backgroundColor = UIColor.init(red: 180.0/255.0, green: 126.0/255.0, blue: 179.0/255.0, alpha: 0.4)
        }else {
             cell.backgroundColor = UIColor.init(red: 180.0/255.0, green: 126.0/255.0, blue: 179.0/255.0, alpha: 0.1)
        }
        
        cell.load(users[indexPath.item])
       /* let user = User(Title: "Title", First: "Antonios", Last: "Todoris", Street: "Ververoda", City: "Kranidi", Email: "anto@gmail.com", Phone: "1234", Cell: "5678", LargePictureURL: "https://randomuser.me/api/portraits/thumb/men/65.jpg", smallPictureURL: "https://randomuser.me/api/portraits/thumb/men/65.jpg")
        cell.load(user) */
        return cell
    }
    
    


    
    
    func getContent(){
        let url = URL(string: "https://randomuser.me/api/?results=25&seed=todoris")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if (error != nil){
                print("ERROR")
            }
            else {
                if let content = data
                {
                    do{
                        //Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let results = myJson["results"] as? NSArray
                        {
                            for result in results{
                                if let dictRes = result as? NSDictionary
                                {
                                    let cell = (dictRes["cell"] as? String)!
                                    let phone = (dictRes["phone"] as? String)!
                                    let email = (dictRes["email"] as? String)!
                                    
                                    var title = ""
                                    var first = ""
                                    var last =  ""
                                    
                                    var street = ""
                                    var city = ""
                                    
                                    var large = ""
                                    var medium = ""
                                    var thumbnail = ""
                                    
                                    if let dictName = dictRes["name"] as? NSDictionary //Creating dictionary for name
                                    {
                                        title = (dictName["title"] as? String)!
                                        first = (dictName["first"] as? String)!
                                        last =  (dictName["last"] as? String)!
                                    }
                                
                                    if let dictLocation = dictRes["location"] as? NSDictionary // Creating dictionary for location
                                    {
                                        street = (dictLocation["street"] as? String)!
                                        city = (dictLocation["city"] as? String)!
                                    }
                                    
                                    if let dictPicture =  dictRes["picture"] as? NSDictionary
                                    {
                                        large = (dictPicture["large"] as? String)!
                                        medium = (dictPicture["medium"] as? String)!
                                        thumbnail = (dictPicture["thumbnail"] as? String)!
                                    }
                                    
                                    let newUser = User(Title: title,
                                                       First: first,
                                                       Last: last,
                                                       Street: street,
                                                       City: city,
                                                       Email: email,
                                                       Phone: phone,
                                                       Cell: cell,
                                                       LargePictureURL: large,
                                                       smallPictureURL: thumbnail)
                                    self.users.append(newUser)
                                    
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                }
                            }
                        }
                    }
                    catch{
                        
                    }
                }
            }
            
        }
        task.resume()
        
   
        
    }

}
