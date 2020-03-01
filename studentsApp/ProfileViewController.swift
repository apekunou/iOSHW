//
//  ProfileViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/27/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var loginText: UILabel!
    
    public var login = ""
    
    public var firstName = ""
    
    public var secondName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel?.text = firstName
        secondNameLabel?.text = secondName
        if login == ""{
          loginText?.text = "Hello, Incognito!"
        }
        else{
          loginText?.text = "Hello, " + login + "!"
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
