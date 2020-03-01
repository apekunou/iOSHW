//
//  MenueViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class MenueViewController: UIViewController {
    
    var loginText = ""
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  guard let profileVC = segue.destination as? ProfileViewController else { return }
    //    detailsVC.firstNameLabel.text = loginText.text ?? ""
          if let profileVC = segue.destination as? ProfileViewController
          {
            profileVC.login = loginText
          }
          if let tableVC = segue.destination as? StudentsViewController
          {
            tableVC.loginText = loginText
          }
    //    detailsVC.secondNameLabel?.text = passwordTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if loginText == ""
        {
            helloLabel.text = "Hello, Incognito!"
        }
        else{
            helloLabel.text = "Hello, " + loginText + " !"
        }
    }

}
