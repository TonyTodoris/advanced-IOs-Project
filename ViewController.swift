//
//  ViewController.swift
//  IOsFinalProject
//
//  Created by Canquery Déborah on 24/01/2019.
//  Copyright © 2019 Epita. All rights reserved.
//

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
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InfoViewCell
        
        if((indexPath.item % 2) == 0 ){
            cell.backgroundColor = UIColor.init(red: 180.0/255.0, green: 126.0/255.0, blue: 179.0/255.0, alpha: 0.4)
        }else {
             cell.backgroundColor = UIColor.init(red: 180.0/255.0, green: 126.0/255.0, blue: 179.0/255.0, alpha: 0.1)
        }
        
        // cell.load(users[indexPath.item])
        let user = User(Title: "Title", First: "Antonios", Last: "Todoris", Street: "Ververoda", City: "Kranidi", Email: "anto@gmail.com", Phone: "1234", Cell: "5678", LargePictureURL: "https://randomuser.me/api/portraits/thumb/men/65.jpg", smallPictureURL: "https://randomuser.me/api/portraits/thumb/men/65.jpg")
        cell.load(user)
        return cell
    }
    
    


    
    
    func getContent(){
        
            guard let url = URL(string: "https://randomuser.me/api/?results=25&seed=todoris") else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
            guard let data = data else { return }
                
           /* let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString)*/
            
            
            do{
             
            } catch let jsonErr{
                print("error serializing json", jsonErr)
            }
                
            
                
            }.resume()
                
    }

}
